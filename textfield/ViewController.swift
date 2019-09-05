//
//  ViewController.swift
//  textfield
//
//  Created by apple on 9/3/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var passwordLBL: UILabel!
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passWordTF: UITextField!
    
    
    @IBOutlet weak var submitLBL: UIButton!
    var correctPassword:Bool!
    var isemailID:Bool!
    var alertStrng:String!
    var alertFlag:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailLBL.isHidden = true
        passwordLBL.isHidden = true
        
        emailTF.delegate = self
        passWordTF.delegate = self
        correctPassword = false
        isemailID = false
       
     
        
      //   emailTF.setBottomBorderWhiteColor()
        emailTF.backgroundColor = .clear
        let border = CALayer()
        let width = CGFloat(3.0)
        border.borderColor = #colorLiteral(red: 0.3882352941, green: 0.5843137255, blue: 0.1137254902, alpha: 1)
        border.frame = CGRect(x: 0, y: emailTF.frame.size.height - width, width:  emailTF.frame.size.width, height: emailTF.frame.size.height)
        border.borderWidth = width
        emailTF.layer.addSublayer(border)
        emailTF.layer.masksToBounds = true
        
        UITextField.appearance().tintColor = #colorLiteral(red: 0.3882352941, green: 0.5843137255, blue: 0.1137254902, alpha: 1)
        
        passWordTF.backgroundColor = .clear
        let borderColour = CALayer()
        let widthSize = CGFloat(3.0)
        borderColour.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7411764706, blue: 0.768627451, alpha: 1)
        borderColour.frame = CGRect(x: 0, y: passWordTF.frame.size.height - widthSize, width:  passWordTF.frame.size.width, height: passWordTF.frame.size.height)
        borderColour.borderWidth = width
        passWordTF.layer.addSublayer(borderColour)
       
        passWordTF.layer.masksToBounds = true

        
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTF
        {
        if isemailID == true
        {
           emailLBL.isHidden = true
            }else
        {
            emailLBL.isHidden = false
            emailLBL.text = "Please enter email id"
            passwordLBL.isHidden = true
            
            
            }
        
        }else if textField == passWordTF
        {
            if passWordTF.text?.isEmpty == true
            {
                
                
                passwordLBL.isHidden =  false
                passwordLBL.text = "please enter password"
          
            }
            print(isemailID)
            if isemailID == false{
               emailLBL.text = "please enter vaild email id"
                
            }
               // passWordTF.setBottomBorder()
            }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  emailTF
        {
          emailLBL.isHidden = true
            passwordLBL.isHidden = true
            return true
        }else if textField ==  passWordTF
        {
         passwordLBL.isHidden = true
            if emailTF.text?.isEmpty == false && passWordTF.text?.isEmpty == false && isemailID == true && correctPassword == true
            {
                submitLBL.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.6941176471, blue: 0.2431372549, alpha: 1)
            }else
            {
                submitLBL.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }
    
            
            
            return true
       
        }
       
        
        
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF
        {
            if emailTF.text?.isEmpty == true
            {
                emailLBL.text = "email text field should not be blank"
            }else if (emailTF.text?.isValidEmail())!
            {
                emailLBL.isHidden = true
                correctPassword = true
                isemailID = true
             
            }else
            {
                
                emailLBL.isHidden = false
                emailLBL.text = "please enter vaild email id "
                isemailID = false
            }
        }
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if (emailTF.text?.isEmpty)!
        {
            alertStrng = "please enter email id"
            alertFlag = true
        }
        if passWordTF.text?.count == 0
        {
            alertStrng = "please enter password "
              alertFlag = true
        }
        if isemailID == false
        {
            alertStrng = "please enter vaild email id"
              alertFlag = true
        }
        if alertFlag == true
        {
            let title = NSLocalizedString("c", comment: "BOOK_PURCHASE")
            let message = NSLocalizedString("BOOK_PURCHASE", comment: "alertController message")
            
            let alertController = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
           let titles = NSLocalizedString("c", comment: "")
            alertController.addAction(UIAlertAction(title: titles, style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }else
        {
            var next = UIStoryboard.init(name: "Main", bundle: nil)
            var second =  next.instantiateViewController(withIdentifier: "second") as! SecondVC
            self.navigationController?.pushViewController(second, animated: true)
        }
        
        
        
        
        
    }
    

}// end of the class
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

    

