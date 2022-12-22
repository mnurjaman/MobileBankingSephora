//
//  FavoritVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 19/12/22.
//

import Foundation
import UIKit

class FavoritVC: UIViewController{
    @IBOutlet weak var imgnav: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imgnav.addGestureRecognizer(tap)
        navigationItem.titleView?.addSubview(imgnav)
        imgnav.isUserInteractionEnabled = true
     
    
        
        
        
        
        
        
        
        
        
        
        
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
            // handling code
            self.navigationController?.popViewController(animated: true)
            
    }
}
struct Favorit{
    let lblTransaksi1: String
    let lblTransaksi2: String
    let lblNominal: String
    let imgTransaksi: String
}

