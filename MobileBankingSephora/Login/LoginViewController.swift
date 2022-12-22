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
    
    @IBOutlet weak var showHideButton: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
   
        
        //img navigation
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
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
    //image Navigation |img tap back
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.navigationController?.popViewController(animated: true)
        
        
    }
    //Popup
  @objc func Homepage(){
        let homepage = HomepageVC()
        self.navigationController?.pushViewController(homepage, animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    func popupBerhasil(){
        let popupBerhasil = PopupBerhasilVC()
        self.navigationController?.pushViewController(popupBerhasil, animated: true)
       
    }
    
        
    
    

    //ACTION
    @IBAction func btnMasuk(_ sender: Any) {
        self.validateLogin()
    }
    
    func validateLogin(){
        let username = usernameField.text!
        let password = passwordField.text!
        let popupberhasil = PopupBerhasilVC()
        let popupgagal = PopupGagalVC()
        let homepage = HomepageVC()
        popupberhasil.modalPresentationStyle = .custom
        popupgagal.modalPresentationStyle = .custom
        if username == "" || password == "" {
            print("Username dan password tidak boleh kosong")
            self.present(popupgagal, animated: true)
        } else {
            print("Username dan password benar")
            //
            AF.request("https://638c3c19d2fc4a058a53e508.mockapi.io/login", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
                switch response.result {
                case .success (let data):
                    do {
                        debugPrint(response)
                        let postBody = try JSONDecoder().decode(dataLogin.self, from: data)
                        if (username == postBody.username && password == postBody.password){
                            print("test response => \(postBody.username) => \(postBody.password)")
                            self.present(popupberhasil, animated: true)
                            popupberhasil.btnTutup.addTarget(self, action: #selector(self.Homepage), for: .touchUpInside)
                            print()
                        } else {
                            self.present(popupgagal, animated: true)
                        }
                    } catch {
                        print("catch error")
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
   
}

struct dataLogin : Decodable{
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey{
        case username, password
    }
}
