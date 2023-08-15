//
//  URLSessionProvider.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit
import SystemConfiguration

let NETWORK = URLSessionProvider.shared

class URLSessionProvider: URLSessionProviderProtocol {
    
    static var shared = URLSessionProvider()
    
    var session: URLSessionProtocol
    let REQUEST_TIME = 80.00
    var online = false
    let imageCache = NSCache<NSString, UIImage>()
    
    // MARK: Initialization
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    // MARK: URL Cache Policy
    
    func urlCachePolicy(_ isCache: Bool) -> URLRequest.CachePolicy {
        online = ReachabilityManager.isOnline()
        return isCache ? (online ? .reloadIgnoringCacheData : .returnCacheDataDontLoad) : .reloadIgnoringCacheData
    }
    
    // MARK: General Function For Request
    
    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
        let request = URLRequest(service: service, cachePolicy: urlCachePolicy(service.method == .GET ? true : false), timeoutInterval: REQUEST_TIME)
        
        var task: URLSessionDataTask? = nil
        task = session.dataTask(request: request, completionHandler: { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            #if DEBUG
            self.info(task!, request.httpBody, data, response, error)
            #endif
            
            self.handleResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task?.resume()
    }
    
    // MARK: General Function To Handle The Response
    
    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ()) {
        guard error == nil else {
            let apiError = APIError(type: online ? .server : .network, message: online ? Constants.serverErrorResponse : Constants.noInternetResponse)
            Console.logError(apiError.type)
            return completion(.onFailure(apiError))
        }
        
        guard let response = response, let apiData = data else {
            let apiError = APIError(type: .noData, message: Constants.noDataResponse)
            Console.logError(apiError.type)
            return completion(.onFailure(apiError))
        }
        
        switch response.statusCode {
        case 200...299:
            guard let result = try? JSONDecoder().decode(T.self, from: apiData) else {
                let apiError = APIError(type: .parsing, message: Constants.parsingErrorResponse)
                Console.logError(apiError.type)
                return completion(.onFailure(apiError))
            }
            completion(.onSuccess(result))
        case 401:
            unauthenticate()
            let apiError = APIError(type: .known, code: response.statusCode, message: Constants.sessionExpiredResponse)
            Console.logError(apiError.type)
            completion(.onFailure(apiError))
        default:
            guard let fail = try? JSONDecoder().decode(Fail.self, from: apiData) else {
                let apiError = APIError(type: .known, code: response.statusCode, message: Constants.generalResponse)
                Console.logError(apiError.type)
                return completion(.onFailure(apiError))
            }
            let apiError = APIError(type: .known, code: response.statusCode, message: fail.message)
            Console.logError(apiError.type)
            completion(.onFailure(apiError))
        }
    }
    
    // MARK: General Function To Log API Info
    
    func info(_ task: URLSessionDataTask, _ httpBody: Data?, _ data: Data?, _ response: URLResponse?, _ error: Error?) {
        let url: String = task.originalRequest?.url?.absoluteString ?? ""
        let headers: [String: String] = task.originalRequest?.allHTTPHeaderFields ?? [:]
        let body: String = {
            return httpBody != nil ? NSString(data: httpBody!, encoding: String.Encoding.utf8.rawValue)! as String : "No body"
        }()
        let statusCode: Int = (task.response as? HTTPURLResponse)?.statusCode ?? 0
        let response: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
        
        Console.logAPI(url, headers, body, statusCode, response, error)
    }
    
    // MARK: Unauthenticate User
    
    func unauthenticate() {
        DispatchQueue.main.async {
//            UserRepo().logOut()
            RootRouter.resetApp()
        }
    }
    
}
