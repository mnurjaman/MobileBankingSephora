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
        
//
//
            //untuk navigate
            
            //        let login = Login()
//        self.navigationController?.pushViewController(login, animated: true)
            //
            
            //        let nav = UINavigationController(rootViewController: vc)
            //        self.window?.rootViewController = nav
            //        self.window?.makeKeyAndVisible()
            //        return true
            
            
            
            
            // Do any additional setup after loading the view.
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
