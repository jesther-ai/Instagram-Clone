//
//  ViewController.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/15/21.
//

import UIKit
import FirebaseAuth
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        try! Auth.auth().signOut()
        handleNotAuthenticated()
        
    }

    
    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil{
            // do / show LoginViewController
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: false)
        }
        
    }
}

