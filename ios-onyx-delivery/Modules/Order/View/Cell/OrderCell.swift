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
            break
        case "1":
            lblStatus.text = "Delivering"
            lblStatus.textColor = .mainText
            break
        case "2":
            lblStatus.text = "Delivered"
            lblStatus.textColor = .subText
            break
        case "3":
            lblStatus.text = "Returned"
            lblStatus.textColor = .appRed
            break
        default:
            lblStatus.text = "New"
            lblStatus.textColor = .appGreen
        }
        
        
        lblOrderId.text = "#\(order.orderId)"
        lblPrice.text = order.price
        lblDate.text = order.date
    }
    
}
