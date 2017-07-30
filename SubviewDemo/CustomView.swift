//
//  CustomView.swift
//  SubviewDemo
//
//  Created by Razgaitis, Paul on 7/30/17.
//  Copyright © 2017 Razgaitis, Paul. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var message: String
    var label: UILabel?
    
    init(frame: CGRect, message: String) {
        self.message = message
        super.init(frame: frame)
        applyStyle()
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyStyle(){
        self.layer.borderWidth = 10
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = self.frame.width / 10
    }
    
    func addLabel(){
        let frame = self.frame
        label = UILabel(frame: frame)
        label?.text = message
        self.addSubview(label!)
    }
    
    func enter(){
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveEaseIn,
            animations: { () -> Void in
                self.center = (self.superview?.center)!
        })
        { (finished) -> Void in
            print("DOne moving")
        }
    }
    
    func exit() {
        let c = CGFloat((superview?.center.x)!)
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseIn,
                       animations: { () -> Void in
                        self.center = CGPoint(x: c, y: 1200)
        })
        { (finished) -> Void in
            self.removeFromSuperview()
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
