//
//  ViewController.swift
//  MotionEffect
//
//
//  A Demo for iOS Development Tips Weekly
//  by Steven Lipton (C)2020, All rights reserved
// Check out the video series on LinkedIn learning at https://linkedin-learning.pxf.io/YxZgj
//  For code go to http://bit.ly/AppPieGithub


import UIKit

class ViewController : UIViewController {
   
    var surferImageView = UIImageView()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    func motionEffects(magnitude:Float)->UIMotionEffectGroup{
        let group = UIMotionEffectGroup()
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        group.motionEffects = [xMotion,yMotion]
        return group
    }
   
    override func viewWillLayoutSubviews() {
        let inset:CGFloat = 200
        let bounds = UIScreen.main.bounds
        surferImageView.frame = bounds.insetBy(dx: inset, dy: inset)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        surferImageView.image = UIImage(named: "Surfer Girl.jpg")
        surferImageView.contentMode = .scaleAspectFill
        surferImageView.addMotionEffect(motionEffects(magnitude: 300))
        backgroundImageView.addMotionEffect(motionEffects(magnitude: 100))
        view.addSubview(surferImageView)
        
    }
}

