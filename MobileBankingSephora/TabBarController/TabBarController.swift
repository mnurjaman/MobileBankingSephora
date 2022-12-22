//
//  TabBarController.swift
//  MobileBankingSephora
//
//  Created by Muhammad Nurjaman on 19/12/22.
//

import UIKit
class TabBarController: UITabBarController{
    override func viewDidLoad() {
        self.viewDidLoad()
        
        let HomepageController = HomepageVC()
        let MutasiController = MutasiVC()
        let TransaksiController = TransaksiVC()
        let FavoritController = FavoritVC()
        let ProfileController = ProfileVC()
        
    }
}

