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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goToLogout(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: "mainpage") as UIViewController
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated:true,completion: nil)
    }
}
