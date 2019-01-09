//
//  CoachDetails.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/8/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit

class CoachDetails: UIViewController {

    @IBOutlet weak var myNavigation: UINavigationBar!
    @IBOutlet weak var lblCoachName: UILabel!
    @IBOutlet weak var lblCoachEmail: UILabel!
    @IBOutlet weak var lblCoachPhone: UILabel!
    @IBOutlet weak var lblCoachInvited: UILabel!
    @IBOutlet weak var switchInviteCoach: UISwitch!
    @IBOutlet weak var imgCoachInvited: UIImageView!
    @IBOutlet weak var lblInviteCoach: UILabel!
    @IBOutlet weak var confirmInvitation: CustomButton!
    
    var coach_name = ""
    var coach_email = ""
    var coach_phone = ""
    var coach_invited = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmInvitation.alpha = 0
        confirmInvitation.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let navItem = UINavigationItem(title: "Coach Details");
        let doneItem = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navItem.rightBarButtonItem = doneItem;
        myNavigation.setItems([navItem], animated: false);
        lblCoachName.text = coach_name
        lblCoachEmail.text = coach_email
        lblCoachPhone.text = coach_phone
        lblCoachInvited.text = "Coach Invited ?"
        
        if coach_invited == 1 {
            imgCoachInvited.image = UIImage(named:"green_checkmark")
            switchInviteCoach.isHidden = true
            lblInviteCoach.isHidden = true
        } else {
            imgCoachInvited.image = UIImage(named:"red_checkmark")
            switchInviteCoach.isHidden = false
            lblInviteCoach.isHidden = false
        }

    }
    
    @IBAction func backToAllCoaches(_ sender: Any) {
        self.presentStoryBoards(storyboardid: "allcoaches", transitionid: "")
    }
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: storyboardid) as UIViewController
         vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated:true,completion: nil)
    }
    
    @IBAction func showConfirmInvitation(_ sender: Any) {
        if switchInviteCoach.isOn {
            showHideConfirmButton(fadeIntensity: 1.0, scale: "original")
        } else {
            showHideConfirmButton(fadeIntensity: 0.0, scale: "minimized")
        }
    }
    
    func showHideConfirmButton(fadeIntensity: Float, scale: String) {
        UIView.animate(withDuration: 0.7, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.confirmInvitation.alpha = CGFloat(fadeIntensity)
            if scale == "minimized" {
                self.confirmInvitation.transform = CGAffineTransform.identity
            } else {
                 self.confirmInvitation.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }, completion: nil)
    }
}
