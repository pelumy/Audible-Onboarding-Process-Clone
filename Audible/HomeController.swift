//
//  HomeController.swift
//  Audible
//
//  Created by mac on 27/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
class HomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "We're logged in"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 84, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }

    @objc func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginController()
        self.navigationController?.present(loginController, animated: true, completion: nil)
    }
}
