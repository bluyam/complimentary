//
//  ViewController.swift
//  compliments
//
//  Created by Kyle Wilson on 12/16/15.
//  Copyright © 2015 Bluyam Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messengerBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set rounded corners for simulated messenger app icon
        messengerBackgroundView.layer.cornerRadius = 13
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

