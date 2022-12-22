//
//  PopupBerhasilVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 02/12/22.
//

import Foundation
import UIKit

class PopupBerhasilVC: ViewController {
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var viewHeader: UIView!
    
    @IBOutlet weak var btnTutup: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //style
        
        viewPopup.cornerRadius = 15
 
        viewHeader.cornerRadius = 15
        btnTutup.cornerRadius = 10
        
        
    }



  
}
