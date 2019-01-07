//
//  CoachRegistration.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/7/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit

class CoachRegistration: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myNavigation: UINavigationBar!
    @IBOutlet weak var inviteCoach: UISwitch!
    @IBOutlet weak var txtCoachName: UITextField!
    @IBOutlet weak var txtCoachEmail: UITextField!
    @IBOutlet weak var txtCoachPhone: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    
    var isInvitationOn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navItem = UINavigationItem(title: "Coach Registration");
        myNavigation.setItems([navItem], animated: false);
        inviteCoach.isOn = false
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
    
}
