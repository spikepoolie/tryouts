//
//  ViewController.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/4/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "options") as UIViewController
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated:true,completion: nil)
    }
    

    @IBAction func newAccount(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "newaccount") as UIViewController
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated:true,completion: nil)
    }
    
   
}

