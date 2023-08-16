//
//  OrderCell.swift
//  ios-onyx-delivery
//
//  Created by Salah's iMac on 15/08/2023.
//

import UIKit

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var viewDetails: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBackground.applyShadow()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with order: OrderModel) {
        switch order.status {
        case "0":
            lblStatus.text = "New"
            lblStatus.textColor = .appGreen
            viewDetails.backgroundColor = .appGreen
            break
        case "1":
            lblStatus.text = "Delivering"
            lblStatus.textColor = .mainText
            viewDetails.backgroundColor = .mainText
            break
        case "2":
            lblStatus.text = "Delivered"
            lblStatus.textColor = .subText
            viewDetails.backgroundColor = .subText
            break
        case "3":
            lblStatus.text = "Returned"
            lblStatus.textColor = .appRed
            viewDetails.backgroundColor = .appRed
            break
        default:
            lblStatus.text = "New"
            lblStatus.textColor = .appGreen
            viewDetails.backgroundColor = .appGreen
        }
        
        
        lblOrderId.text = "#\(order.orderId)"
        lblDate.text = order.date
        
        guard let price = order.price?.components(separatedBy: ".")[0] else {
            lblPrice.text = "0 LE"
            return
        }
        lblPrice.text = "\(price) LE"
    }
    
}
