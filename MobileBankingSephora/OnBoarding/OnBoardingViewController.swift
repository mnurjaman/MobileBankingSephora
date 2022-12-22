//
//  OnBoardingViewController.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 28/11/22.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController{
//
 
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnCreateAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //menghilangkan navigasi
        self.navigationController?.isNavigationBarHidden = true
        
       
        btnLogin.addTarget(self, action: #selector(onScreenLogin), for: .touchUpInside)
        btnCreateAccount.addTarget(self, action: #selector(onScreenRegister), for: .touchUpInside)
        
        btnLogin.cornerRadius = 10
        
   
        }
    @objc
    func onScreenLogin(){
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc
    func onScreenRegister(){
        let Register = RegisterVC()
        self.navigationController?.pushViewController(Register, animated: true)
    }

        
        
        
    
    
}
