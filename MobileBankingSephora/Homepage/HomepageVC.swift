//
//  HomepageVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 07/12/22.
//

import Foundation
import UIKit

class HomepageVC: ViewController {
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewAktivasi: UIView!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var viewFitur: UIView!
    @IBOutlet weak var viewRiwayat: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIScreen.main.bounds
       
        //view Header
        viewProfile.cornerRadius = 12
        
        //viewAktivasi
        viewAktivasi.cornerRadius = 15
        
        //viewCard
        viewCard.cornerRadius = 15
        self.viewCard.backgroundColor = UIColor(patternImage: UIImage(named: "imgCard.png")!)
        
        //viewFitur
        viewFitur.cornerRadius = 15
        
        
        //view Riwayat
        viewRiwayat.cornerRadius = 15
    }
  
}

