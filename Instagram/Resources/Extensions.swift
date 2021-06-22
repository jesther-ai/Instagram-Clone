//
//  Extensions.swift
//  Instagram
//
//  Created by Jesther Silvestre on 6/16/21.
//

import UIKit
extension UIView{
    public var width:CGFloat{
        return frame.size.width
    }
    public var height:CGFloat{
        return frame.size.height
    }
    public var top:CGFloat{
        return frame.origin.y
    }
    public var bottom:CGFloat{
        return frame.origin.y + frame.size.height
    }
    public var left:CGFloat{
        return frame.origin.x
    }
    public var right:CGFloat{
        return frame.origin.x + frame.size.width
    }
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLoginButton()
        }
        return true
    }
}

extension RegistrationViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }else if textField == emailField{
            passwordField.becomeFirstResponder()
        }else{
            didTapRegister()
        }
        return true
    }
}

extension String{
     func safeDatabase() -> String{
        return self.replacingOccurrences(of: "@", with: "-").replacingOccurrences(of: ".", with: "-")
    }
}

