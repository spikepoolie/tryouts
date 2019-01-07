//
//  Coaches.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/6/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit

class Coaches: UIViewController {

    @IBOutlet weak var myNavigation: UINavigationBar!
    @IBOutlet weak var btnDeleteCoach: CustomButton!
    @IBOutlet weak var btnAddCoach: CustomButton!
    @IBOutlet weak var btnInviteCoach: CustomButton!
    @IBOutlet weak var btnAllCoaches: CustomButton!
    
    var currentVerticalAddCoach = 0.0
    var currentVerticalDeleteCoach = 0.0
    var currentVerticalInviteCoach = 0.0
    var currentVerticalAllCoaches = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVerticalAddCoach = Double(btnAddCoach.center.y)
        currentVerticalDeleteCoach = Double(btnDeleteCoach.center.y)
        currentVerticalInviteCoach = Double(btnInviteCoach.center.y)
        currentVerticalAllCoaches = Double(btnAllCoaches.center.y)
        
        btnAddCoach.center.y = -1000
        btnDeleteCoach.center.y = -1000
        btnInviteCoach.center.y = -1000
        btnAllCoaches.center.y = -1000
        
        let navItem = UINavigationItem(title: "Coaches");
        myNavigation.setItems([navItem], animated: false);
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let duration: Double = 0.5
        let delay: Double = 0.0
        UIButton.animate(withDuration: duration,delay: delay, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.moveButtons(btn: self.btnAddCoach)
        })
        UIButton.animate(withDuration: duration,delay: 0.15, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.moveButtons(btn: self.btnDeleteCoach)
        })
        UIButton.animate(withDuration: duration,delay: 0.30, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.moveButtons(btn: self.btnInviteCoach)
        })
        UIButton.animate(withDuration: duration,delay: 0.45, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.moveButtons(btn: self.btnAllCoaches)
        })
    }

    @IBAction func goBackToMainPage(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "options") as UIViewController
//        vc.modalTransitionStyle = .coverVertical
//        self.present(vc,animated:true,completion: nil)
        presentStoryBoards(storyboardid: "options", transitionid: "")
    }
    
    @IBAction func backToMainOptions(_ sender: Any) {
         presentStoryBoards(storyboardid: "options", transitionid: "")
    }
    
    @IBAction func goToAddCoach(_ sender: Any) {
        presentStoryBoards(storyboardid: "coachregistration", transitionid: "")
    }
    
    func moveButtons(btn: UIButton) {
        switch btn {
        case btnAddCoach :
            btn.center.y = CGFloat(currentVerticalAddCoach)
            break
        case btnDeleteCoach :
            btn.center.y = CGFloat(currentVerticalDeleteCoach)
            break
        case btnInviteCoach :
            btn.center.y = CGFloat(currentVerticalInviteCoach)
            break
        case btnAllCoaches :
            btn.center.y = CGFloat(currentVerticalAllCoaches)
            break
        default: break
            
        }
    }
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: storyboardid) as UIViewController
        self.present(vc,animated:true,completion: nil)
    }
}
