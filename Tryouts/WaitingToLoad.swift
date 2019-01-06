//
//  WaitingToLoad.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 05/01/2019
//  Copyright © 2019 Tryouts. All rights reserved.
//

import UIKit

class WaitingToLoad: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius=5
        myView.layer.shadowOpacity=0.3
        myView.layer.borderWidth=1.5
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
