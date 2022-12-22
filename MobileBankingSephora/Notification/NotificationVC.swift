//
//  NotificationVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 19/12/22.
//


import Foundation
import UIKit

class NotificationVC: UIViewController{

    @IBOutlet weak var imgNavigation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imgNavigation.addGestureRecognizer(tap)
        navigationItem.titleView?.addSubview(imgNavigation)
        imgNavigation.isUserInteractionEnabled = true
     
    
        
        
        
        
        
        
        
        
    
            
        }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
            // handling code
            self.navigationController?.popViewController(animated: true)
            
    }
}
