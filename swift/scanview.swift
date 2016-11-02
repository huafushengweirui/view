//
//  scanview.swift
//  scan
//  Copyright © 2016年 lixin. All rights reserved.
//

import UIKit

class scanview: UIView {
    var picturename:Int = 1{
        didSet{
            setNeedsDisplay()
        }
    } //over
    override func drawRect(rect: CGRect) {
        let pic = UIImage(named:"\(picturename)")        
        guard (pic != nil) else{
            return
        }
        pic!.drawInRect(self.bounds)
    }//over
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        guard (touch != nil) else{
            return
        }
        let point = touch!.locationInView(self)
        if point.x < self.bounds.width / 2.0 {
            picturename -= 1
            if picturename < 1 {
                picturename = 1
            }
        }
        if point.x > self.bounds.width / 2.0 {
            picturename += 1
            if picturename > 6{
                picturename = 6
            }
        }
    }// over
}
