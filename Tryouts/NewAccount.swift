//
//  NewAccount.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/4/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    // Next step here
}



class NewAccount: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myNavigation: UINavigationBar!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var coachname: UITextField!
    @IBOutlet weak var teamname: UITextField!
    @IBOutlet weak var organization: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var ref: DatabaseReference?
    var storageRef: StorageReference?
    
    
    override func viewDidLoad() {
        ref = Database.database().reference().child("TryOutCoaches")
        super.viewDidLoad()
        email.underlined()
        password.underlined()
        coachname.underlined()
        teamname.underlined()
        organization.underlined()
        phone.underlined()
        
        let navItem = UINavigationItem(title: "New Account");
        let doneItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navItem.rightBarButtonItem = doneItem;
        myNavigation.setItems([navItem], animated: false);

    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createNewAccount(_ sender: Any) {
        presentStoryBoards(storyboardid: "watingtoload", transitionid: "")
        let key = self.ref?.childByAutoId().key
        let newUser = [
            "username" : email.text!,
            "password" : password.text!,
            "organization_name" : organization.text!,
            "team_name" : teamname.text!,
            "coach" : coachname.text!,
            "cellphone" : phone.text!,
            "user_key": "\(email.text!)_\(password.text!)"
        ] as [String : Any]
        if (self.ref?.child(key!).setValue( newUser )) != nil{
            UserDefaults.standard.set("\(email.text!)_\(password.text!)", forKey:  "myuserid")
            self.dismiss(animated: true, completion: nil)
            self.presentStoryBoards(storyboardid: "mainpage", transitionid: "")
        } else {
            print("Nao funcionou")
        }
    }
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "mainpage") as UIViewController
        if transitionid != "" {
            vc.modalTransitionStyle = .flipHorizontal
        }
        self.present(vc,animated:true,completion: nil)
        //return vc
    }
    


}


