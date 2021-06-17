//
//  AuthManager.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/16/21.
//
import FirebaseAuth
import UIKit
class AuthManager{
    static public let shared:AuthManager = AuthManager()
    
    //MARK: - public functions
    
    public func registerNewUser(username:String, email:String, password:String){
        
    }
    
    public func loginUser(username:String?, email:String?, password:String, completion: @escaping (Bool)->Void){
        //login with email
        if email == email{
            guard let email = email else {return}
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        //login with username
        else if username == username{
            print(username! as String)
        }
    }
}
