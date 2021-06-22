//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/15/21.
//

import FirebaseDatabase

public class DatabaseManager{
    public static let shared = DatabaseManager()
    var database = Database.database().reference()
    
    //MARK: - Public
    
    /// Check if username and email is available
    /// - Parameters
    /// email: String representing email
    /// username:String representing username
    public func canCreateNewUser(with email:String, username:String, completion:(Bool)->Void){
        completion(true)
    }
    
    //MARK: - Public
    
    /// Insert new data to Database
    /// - Parameters
    /// email: String representing email
    /// username:String representing username
    /// -completion: Async callback for result if database entry succeded
    public func insertNewUser(with email:String, username:String, completion:@escaping (Bool)->Void){
        database.child(email.safeDatabase()).setValue(["username":username]) { err, _ in
            if err == nil{
                completion(true)
                return
            }
            else{
                completion(false)
                return
            }
        }
    }
}
