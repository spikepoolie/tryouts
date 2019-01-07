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
    override func viewDidLoad() {
        super.viewDidLoad()
        let navItem = UINavigationItem(title: "Coaches");
        myNavigation.setItems([navItem], animated: false);
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBackToMainPage(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "options") as UIViewController
        vc.modalTransitionStyle = .coverVertical
        self.present(vc,animated:true,completion: nil)
    }
    

}
