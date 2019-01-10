//
//  MainOptions.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/6/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit

class MainOptions: UIViewController {

    @IBOutlet weak var myNavigation: UINavigationBar!

    @IBOutlet weak var myCoach: UIImageView!
    @IBOutlet weak var myPlayer: UIImageView!
    @IBOutlet weak var myTryouts: UIImageView!
    @IBOutlet weak var myResults: UIImageView!
    
    @IBOutlet weak var horizontalLineRight: UIImageView!
    @IBOutlet weak var horizontalLineLeft: UIImageView!
    @IBOutlet weak var verticalLineTop: UIImageView!
    @IBOutlet weak var verticalLineBottom: UIImageView!
    
    @IBOutlet weak var lblTryOut: UILabel!
    @IBOutlet weak var lblPlayer: UILabel!
    @IBOutlet weak var lblCoach: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    var currentCoachtryoutPositon = 0.0
    var currentPlayerResultsPositon = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentCoachtryoutPositon = Double(myCoach.center.x)
        currentPlayerResultsPositon = Double(myResults.center.x)
        myCoach.center.x = -300
        myTryouts.center.x = -300
        myPlayer.center.x =  500
        myResults.center.x = 500
        lblCoach.alpha = 0.0
        horizontalLineLeft.alpha = 0.0
        lblPlayer.alpha = 0.0
        horizontalLineRight.alpha = 0.0
        lblResult.alpha = 0.0
        verticalLineTop.alpha = 0.0
        lblTryOut.alpha = 0.0
        verticalLineBottom.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let duration: Double = 0.5
        let delay: Double = 0.0
        UIImageView.animate(withDuration: duration,delay: delay, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.5, options: .curveEaseIn, animations: {
            self.moveIcons(image: self.myCoach)
            self.moveIcons(image: self.myPlayer)
            self.moveIcons(image: self.myTryouts)
            self.moveIcons(image: self.myResults)
        }) { (_) in
            
            UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.lblCoach.alpha = 1.0
                self.horizontalLineLeft.alpha = 1.0
            }, completion: nil)
            
            UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.lblPlayer.alpha = 1.0
                self.verticalLineTop.alpha = 1.0
            }, completion: nil)
            
            UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.lblTryOut.alpha = 1.0
                self.verticalLineBottom.alpha = 1.0
            }, completion: nil)
            
            UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.lblResult.alpha = 1.0
                self.horizontalLineRight.alpha = 1.0
            }, completion: nil)
          
        }
    }

    
    @IBAction func goToCoaches(_ sender: Any) {
        presentStoryBoards(storyboardid: "coaches", transitionid: "")
    }
    
    
    @IBAction func goToLogout(_ sender: Any) {
        presentStoryBoards(storyboardid: "mainpage", transitionid: "flipHorizontal")
    }
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: storyboardid) as UIViewController
        if transitionid != "" {
            vc.modalTransitionStyle = .flipHorizontal
        }
        self.present(vc,animated:true,completion: nil)
    }
    
    func moveIcons(image: UIImageView) {
        switch image {
        case myCoach, myTryouts:
           image.center.x = CGFloat(currentCoachtryoutPositon)
           
        break
        default:
           image.center.x = CGFloat(currentPlayerResultsPositon)
        }
    }
}
