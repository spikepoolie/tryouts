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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        //return vc
    }
}
