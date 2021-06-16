//
//  LoginViewController.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //UI Codes
    private let usernameEmailField:UITextField = {
       return UITextField()
    }()
    
    private let passwordTextField:UITextField = {
        let password = UITextField()
        password.isSecureTextEntry = true
        return password
    }()
    
    private let loginButton:UIButton = {
        return UIButton()
    }()
    
    private let termsButton:UIButton = {
        return UIButton()
    }()
    
    private let privacyButton:UIButton = {
        return UIButton()
    }()
    
    private let createAccountButton:UIButton = {
        return UIButton()
    }()
    
    private let headerView:UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //assign frames
    }
    
    //adding view via function
    
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    //actions for buttons
    
    @objc private func didTapLoginButton(){}
    @objc private func didTapTermsButton(){}
    @objc private func didTapPrivacyButton(){}
    @objc private func didTapCreateAccountButton(){}
    
}
