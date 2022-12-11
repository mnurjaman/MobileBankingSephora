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
        
        btnTutup.addTarget(self, action: #selector(actionClose), for: .touchUpInside)
        
        
        
        
        //style
        
        viewPopup.cornerRadius = 15
        viewHeader.cornerRadius = 15
        btnTutup.cornerRadius = 10
        
        
    }
    @objc
    func actionClose(){
        // Menutup view popup
//        self.dismiss(animated: false)
        let homepage = HomepageVC()
        self.navigationController?.pushViewController(homepage, animated: true)
        self.present(homepage, animated: true)
      
//
    }
    @IBAction func btnTutup(_ sender: Any) {
        // Menutup view popup
//        self.dismiss(animated: true, completion: nil)

        // Mengarahkan ke homepage
        
        let homepage = HomepageVC()
        self.navigationController?.pushViewController(homepage, animated: true)
        self.present(homepage, animated: true)
    
        
    }

}
