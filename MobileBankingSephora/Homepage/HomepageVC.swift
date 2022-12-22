//
//  HomepageVC.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 07/12/22.
//

import Foundation
import UIKit
import Alamofire


class HomepageVC: UIViewController {

    
   
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var viewbtnSalin: UIView!
    
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var lblnumberAccount: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblaccountName: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var viewRiwayatTransaksi: UIView!
    @IBOutlet weak var btnListFavorit: UIButton!
    @IBOutlet weak var btnListTransaksi: UIButton!
    @IBOutlet weak var viewbgTable: UIView!
    @IBOutlet weak var imgNotification: UIImageView!
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var viewTransaksi: UIView!
    @IBOutlet weak var imgFavorit: UIImageView!
    
    @IBOutlet weak var imgMutasi: UIImageView!
    @IBOutlet weak var imgProfil: UIImageView!
    
    @IBOutlet weak var tableViewFav: UITableView!
    
    let data: [Transaksi] = [
        Transaksi(lblTransaksi1: "Top Up E-Wallet", lblTransaksi2: "Gopay - 08123123123", lblNominal: "Rp.14.000.000", imgTransaksi: "icon"),
        Transaksi(lblTransaksi1: "Transfer Masuk", lblTransaksi2: "BRI - 3453 3434 3435", lblNominal: "Rp.130.000.000", imgTransaksi: "icon1"),
        Transaksi(lblTransaksi1: "Pembelian", lblTransaksi2: "Telkomsel - 08123123123", lblNominal: "Rp.140.000.000", imgTransaksi: "icon2")
    ]
//    let data: [Favorit] = [
//        Favorit.
//        Fav
////        Fav
//
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIScreen.main.bounds
        self.request()
        
        //navigation Daftar Favorit
        btnListFavorit.addTarget(self, action: #selector(onDaftarFavorit), for: .touchUpInside)
        //navigation Notification
        
        //Table View
        let nib = UINib(nibName: "CellList", bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: "CellListItem")
        tabelView.dataSource = self
        tabelView.delegate = self
        
    

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imgNotification.addGestureRecognizer(tap)
        imgNotification.isUserInteractionEnabled = true
        
        let next = UITapGestureRecognizer(target: self, action: #selector(self.handleClick(_:)))
        imgFavorit.addGestureRecognizer(next)
        imgFavorit.isUserInteractionEnabled = true
        
       

    

//        //view Style
        viewProfile.cornerRadius = 12
        viewCard.cornerRadius = 15
        self.viewCard.backgroundColor = UIColor(patternImage: UIImage(named: "imgCard.png")!)
        viewbtnSalin.cornerRadius = 10
        viewMenu.cornerRadius = 15
        viewRiwayatTransaksi.cornerRadius = 15
        viewbgTable.cornerRadius = 15
        viewTransaksi.cornerRadius = 30
        

    }
    func request(){
        let accountName = lblaccountName.text!
        let numberAccount = lblnumberAccount.text!
        let currency = lblCurrency.text!
        let balance = lblBalance.text!
        AF.request("https://638c3c19d2fc4a058a53e508.mockapi.io/getAccount", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            debugPrint(response)
                            let postBody = try JSONDecoder().decode(dataAccount.self, from: data)
                            print("test response => \(postBody.accountName) => \(postBody.accountNumber) => \(postBody.currency) => \(postBody.balance) ")
                            self.lblnumberAccount.text = postBody.accountName
                            self.lblnumberAccount.text = postBody.accountNumber
                            self.lblCurrency.text = postBody.currency
                            self.lblBalance.text = String(postBody.balance)
                            print()
        //
                         } catch  {
                             print("catch error")
                         }
                    case .failure(let error):
                        print(error)
                    }
                }
    }
    
    
    
    @objc
    func onDaftarFavorit(){
        let DaftarFavorit = FavoritVC()
        self.navigationController?.pushViewController(DaftarFavorit, animated: true)
        
    }
    //img tap back
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let Notification = NotificationVC()
       
        navigationItem.titleView?.addSubview(imgNotification)
        self.navigationController?.pushViewController(Notification, animated: true)
       

    }
    @objc func handleClick(_ sender: UITapGestureRecognizer? = nil) {
        let Favorit = FavoritVC()
        navigationItem.titleView?.addSubview(imgFavorit)
        self.navigationController?.pushViewController(Favorit, animated: true)
    }


  
}
extension HomepageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
//        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Transaksi = data[indexPath.row]
        let CellList = tableView.dequeueReusableCell(withIdentifier: "CellListItem", for: indexPath) as! CellList
        CellList.imgTransaksi.image = UIImage(named: Transaksi.imgTransaksi)
        CellList.lblTransaksi1.text = Transaksi.lblTransaksi1
        CellList.lblTransaksi2.text = Transaksi.lblTransaksi2
        CellList.lblNominal.text = Transaksi.lblNominal
        return CellList
    }
}
//extension TableViewFav : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
////        return 3
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let Favorit = data[indexPath.row]
//        let CellFavorit = tableView.dequeueReusableCell(withIdentifier: "CellListFav", for: indexPath) as! CellList
//
//
//        return CellList
//    }
//}


struct dataAccount : Decodable{
    let accountName: String
    let accountNumber: String
    let balance: Int
    let currency: String
    
    enum CodingKeys: String, CodingKey{
        case accountName, accountNumber, balance, currency
    }
}
struct Transaksi{
    let lblTransaksi1: String
    let lblTransaksi2: String
    let lblNominal: String
    let imgTransaksi: String
}
struct favorit{
    let lblTFavorit: String
    let imgTransaksi: String
}
