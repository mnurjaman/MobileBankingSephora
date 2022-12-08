//
//  PopupGagalVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 02/12/22.
//

import Foundation
import UIKit

class PopupGagalVC: ViewController {
  
    @IBOutlet var viewPopup: UIView!
    
    @IBOutlet weak var btnCobalagi: UIButton!
    @IBOutlet weak var btnTutup: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Clone Popup
        btnTutup.addTarget(self, action: #selector(actionClose), for: .touchUpInside)
        btnCobalagi.addTarget(self, action: #selector(actionClose), for: .touchUpInside)
        
        
        
        viewPopup.cornerRadius = 15
        btnTutup.cornerRadius = 10
        btnCobalagi.cornerRadius = 10
    }
    //func close Popup
    @objc
    func actionClose(){
        self.dismiss(animated: false)
    }
}
