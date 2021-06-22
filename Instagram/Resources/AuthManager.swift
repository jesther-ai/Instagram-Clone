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
    
    public func registerNewUser(username:String, email:String, password:String, completion:@escaping (Bool)->Void){
        /*
         
         - check if email is available
         - Create account if both available
         - Insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate{
                //- check if username is available
                Auth.auth().createUser(withEmail: email, password: password) { result, err in
                    guard err == nil, result != nil else{
                        completion(false)
                        return
                    }
                    //insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else{
                            //failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                //username or email does not exist
                completion(false)
            }
        }
        
        
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
