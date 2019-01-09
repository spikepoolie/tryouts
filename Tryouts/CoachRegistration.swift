//
//  CoachRegistration.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/7/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit
import FirebaseFirestore

class CoachRegistration: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myNavigation: UINavigationBar!
    @IBOutlet weak var inviteCoach: UISwitch!
    @IBOutlet weak var txtCoachName: UITextField!
    @IBOutlet weak var txtCoachEmail: UITextField!
    @IBOutlet weak var txtCoachPhone: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    
    var isInvitationOn = 0
    var teamCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navItem = UINavigationItem(title: "Coach Registration");
        myNavigation.setItems([navItem], animated: false);
        inviteCoach.isOn = false
        txtCode.delegate = self
        txtCoachName.delegate = self
        txtCoachEmail.delegate = self
        txtCoachPhone.delegate = self
        txtCode.delegate = self
    }

    

    @IBAction func backToCoaches(_ sender: Any) {
        self.presentStoryBoards(storyboardid: "coaches", transitionid: "")
    }
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        self.view.endEditing(true)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: storyboardid) as UIViewController
        self.present(vc,animated:true,completion: nil)
        //return vc
    }
    
    @IBAction func inviteCoachToTeam(_ sender: Any) {
        if inviteCoach.isOn {
            isInvitationOn = 1
            txtCode.isHidden = false
        } else {
            isInvitationOn = 0
            txtCode.isHidden = true
        }
    }
    
    @IBAction func addCoach(_ sender: Any) {
        let db = Firestore.firestore()
        if txtCode == nil {
            txtCode.text = teamCode
        }
        db.collection("coaches").document(txtCoachEmail.text!).setData([
            "coach_name":   txtCoachName.text!,
            "coach_phone":  txtCoachPhone.text!,
            "coach_email":  txtCoachEmail.text!,
            "coach_invited": isInvitationOn,
            "team_code": txtCode.text!
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
               self.presentStoryBoards(storyboardid: "allcoaches", transitionid: "")
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // if Int(self.view.frame.size.height) < 569{ // iphone 5 or older
      //  moveTextField(textField: textField, moveDistance: -250, up: true)
        //}
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // if Int(self.view.frame.size.height) < 569{ // iphone 5 or older
      //  moveTextField(textField: textField, moveDistance: -250, up: false)
        // }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up:Bool){
        let moveDuration = 0.3
        let movement : CGFloat = CGFloat(up ? moveDistance:-moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0,dy: movement)
        UIView.commitAnimations()
    }
}
