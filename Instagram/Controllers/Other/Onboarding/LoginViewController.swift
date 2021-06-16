//
//  LoginViewController.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/15/21.
//

import UIKit
import SafariServices
class LoginViewController: UIViewController {
    
    //UI Codes
    internal let usernameEmailField:UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    internal let passwordField:UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    internal let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constant.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton:UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton:UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton:UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView:UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        view.backgroundColor = .systemBackground
        addSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //assign frames
        
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3.0)
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 40, width: view.width - 50, height: 52.0)
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: view.width - 50, height: 52.0)
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: view.width - 50, height: 52.0)
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.width - 50, height: 52.0)
        termsButton.frame = CGRect(x:10, y: view.height-view.safeAreaInsets.bottom-100, width: view.width-20, height: 50)
        privacyButton.frame = CGRect(x:10, y: view.height-view.safeAreaInsets.bottom-50, width: view.width-20, height: 50)
        configureHeaderView()
    }
    
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else{return}
        guard let backgroundView = headerView.subviews.first else{return}
        backgroundView.frame = headerView.bounds
        
        //adding instagram logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top/5.0, width: headerView.width/2.0, height: headerView.width-view.safeAreaInsets.top)
    }
    
    //adding view via function
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    //actions for buttons
    
    @objc internal func didTapLoginButton(){
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        //guard-let for username, email and password inputs.
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {return}
        //login functionality here
    }
    @objc internal func didTapTermsButton(){
        guard let address = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {return}
        let vc = SFSafariViewController(url: address)
        present(vc, animated: true)
    }
    @objc internal func didTapPrivacyButton(){
        guard let address = URL(string: "https://help.instagram.com/519522125107875") else {return}
        let vc = SFSafariViewController(url: address)
        present(vc, animated: true)
        
    }
    @objc internal func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
}
