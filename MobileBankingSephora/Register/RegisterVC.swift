//
//  RegisterVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 29/11/22.
//

import Foundation
import UIKit


class RegisterVC: ViewController, UITextFieldDelegate{
    
//    @IBOutlet weak var btnBack: UIButton!
    
//    @IBOutlet weak var imgBack: UIImageView!
    
    @IBOutlet weak var imgNav: UIImageView!
    @IBOutlet weak var viewContent: UIView!
    
    @IBOutlet weak var nikField: UITextField!
    @IBOutlet weak var notelponField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var btnSelanjutnya: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        //
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imgNav.addGestureRecognizer(tap)
        imgNav.isUserInteractionEnabled = true
        navigationItem.titleView?.addSubview(imgNav)
        btnSelanjutnya.addTarget(self, action: #selector(onNextScreen), for: .touchUpInside)
        
       //style
        viewContent.layer.cornerRadius = 15
        viewContent.layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 3.0).cgColor
        viewContent.layer.shadowOffset = CGSize(width: 0, height: 1.75)
        viewContent.layer.shadowRadius = 1.7
        
        

        // Input Text
        nikField.delegate = self
        notelponField.delegate = self
        nameField.delegate = self
        dateField.delegate = self
        emailField.delegate = self
        
        
        
        

    }
    @objc
    func OnBack(){
//        self.navigationController?.popViewController(animated: false)
        self.navigationItem.titleView = imgNav
        navigationItem.titleView = imgNav
        self.navigationItem.titleView?.addSubview(imgNav)
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        
        self.navigationController?.popViewController(animated: true)
    }
    
    //PopUP
    @objc func onNextScreen(){
        let homepage = HomepageVC()
        self.navigationController?.pushViewController(homepage, animated: true)
        self.dismiss(animated: true, completion: nil)
//         let popUp = PopupGagalVC()
//        popUp.modalPresentationStyle = .custom
//         self.present(popUp, animated: false)
    
         
     }
    
    func createToolbar() -> UIToolbar{
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([donebtn], animated: true)
        
        return toolbar
    }
    func createDatePicker() {
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
        }
        datePicker.datePickerMode = .date
        dateField.textAlignment = .left
        dateField.inputView = datePicker
        dateField.inputAccessoryView = createToolbar()
        
    }
    @objc
    func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    @IBAction func printTap(_ sender: Any) {
        
        print("\(nikField.text)")
        print("\(notelponField.text)")
        print("\(nameField.text)")
        print("\(dateField.text)")
        print("\(emailField.text)")
        
    }
}

