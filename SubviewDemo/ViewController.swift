//
//  ViewController.swift
//  SubviewDemo
//
//  Created by Razgaitis, Paul on 7/30/17.
//  Copyright © 2017 Razgaitis, Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customViewPresent: Bool = false
    var customView: CustomView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showCustomView() {
        customViewPresent = true
        let center = self.view.center
        
        let frame = CGRect(x: 0, y: 0, width: 300, height: 150)
        customView = CustomView(frame: frame, message: "I am a Message")
        
        self.view.addSubview(customView!)
        customView?.enter()
    }
    
    func hideCustomView(){
        customViewPresent = false
        customView?.exit()
    }
    
    // MARK: - OUTLETS
    @IBOutlet weak var button: UIButton!
    
    // MARK: - ACTIONS
    @IBAction func subviewAction(_ sender: Any) {
        
        if !customViewPresent {
            showCustomView()
            self.button.setTitle("Hide Subview", for: .normal)
        } else {
            hideCustomView()
            self.button.setTitle("Show Subview", for: .normal)
        }
        
    }
    
}

