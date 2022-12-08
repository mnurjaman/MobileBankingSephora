//
//  Login.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 28/11/22.
//



import Foundation
import UIKit
import Alamofire
class LoginViewController: ViewController, UITextFieldDelegate{

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var btnMasuk: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var imgNav: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://638c3c19d2fc4a058a53e508.mockapi.io/login").response { response in
            debugPrint(response)
        }
        //tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        //
        let userName = usernameField.text
        let userPassword = passwordField.text
        
        
        //Popup
        btnMasuk.addTarget(self, action: #selector(onNextScreen), for: .touchUpInside)
        //img navigation
        imgNav.addGestureRecognizer(tap)
        navigationItem.titleView?.addSubview(imgNav)
        imgNav.isUserInteractionEnabled = true

        
        
        
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        
        
    
        
        //Custom View and button
        contentView.layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        contentView.layer.shadowRadius = 1.7
        contentView.layer.shadowOpacity = 0.45
        allView.layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        allView.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        allView.layer.shadowRadius = 1.7
        allView.layer.shadowOpacity = 0.45
        btnMasuk.cornerRadius = 10
        
       
    }
   
    //resetForm

    
    //image Navigation
    func OnBack(){
//        self.navigationController?.popViewController(animated: false)
        self.navigationItem.titleView = imgNav
        navigationItem.titleView = imgNav
        self.navigationItem.titleView?.addSubview(imgNav)
        
    }
    //img tap back
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMasuk(_ sender: Any) {
    
        print("\(String(describing: usernameField.text))")
        print("\(String(describing: passwordField.text))")
    }
 //Popup
   @objc func onNextScreen(){
        let popUp = PopupBerhasilVC()
       popUp.modalPresentationStyle = .popover
        self.present(popUp, animated: false)
       
        
    }
    


}
    
