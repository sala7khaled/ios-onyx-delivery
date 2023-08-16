//
//  DatabaseManager.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import Foundation
import SQLite3

class LocalDataSource {
    static let shared = LocalDataSource()

    private var database: OpaquePointer?

    private init() {
        let dbPath = getDatabasePath()
        if sqlite3_open(dbPath, &database) != SQLITE_OK {
            print("Could not open database")
        }

        createTablesIfNeeded()
    }

    private func getDatabasePath() -> String {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return documentsDirectory.appending("/myDatabase.sqlite")
    }

    private func createTablesIfNeeded() {
        let createTableQuery = """
            CREATE TABLE IF NOT EXISTS Bill (
                number TEXT,
                date TEXT,
                tax TEXT,
                status TEXT,
                customer TEXT
            );
        """

        if sqlite3_exec(database, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error creating table")
        }
    }

    func upsertBills(bills: [Bill]) {
        
        removeAllBills()
        let upsertQuery = """
            INSERT OR REPLACE INTO Bill (number, date, tax, status, customer)
            VALUES (?, ?, ?, ?, ?);
        """
        
        for bill in bills {
            var statement: OpaquePointer?
            if sqlite3_prepare_v2(database, upsertQuery, -1, &statement, nil) == SQLITE_OK {
                sqlite3_bind_text(statement, 1, (bill.number! as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 2, (bill.date! as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 3, (bill.tax! as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 4, (bill.status! as NSString).utf8String, -1, nil)
                sqlite3_bind_text(statement, 5, (bill.customer! as NSString).utf8String, -1, nil)
                
                if sqlite3_step(statement) != SQLITE_DONE {
                    print("Error upserting bill")
                }
            }
            
            sqlite3_finalize(statement)
        }
    }
    
    func retrieveBills(status: String) -> [Bill] {
        let retrieveAllQuery = """
            SELECT * FROM Bill WHERE status = \(status);
        """

        var statement: OpaquePointer?
        var bills: [Bill] = []

        if sqlite3_prepare_v2(database, retrieveAllQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let number = String(cString: sqlite3_column_text(statement, 0))
                let date = String(cString: sqlite3_column_text(statement, 1))
                let tax = String(cString: sqlite3_column_text(statement, 2))
                let status = String(cString: sqlite3_column_text(statement, 3))
                let customer = String(cString: sqlite3_column_text(statement, 4))

                let bill = Bill(number: number, date: date, tax: tax, status: status, customer: customer)
                bills.append(bill)
            }
        }

        sqlite3_finalize(statement)
        return bills
    }
    
    private func removeAllBills() {
        let deleteQuery = """
            DELETE FROM Bill;
        """
        
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(database, deleteQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) != SQLITE_DONE {
                print("Error removing bills")
            }
        }
        
        sqlite3_finalize(statement)
    }
}
