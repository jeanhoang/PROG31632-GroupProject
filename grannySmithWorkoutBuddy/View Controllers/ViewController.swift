//
//  ViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-03-29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var imageLayer:CALayer?
   
    @IBOutlet var volSlider : UISlider!
    var soundPlayer = AVAudioPlayer()
    
    @IBAction func volumeDidChange(sender : UISlider) {
        soundPlayer.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let soundURL = Bundle.main.path(forResource: "backgroundmusic", ofType: "m4a")
        let url = URL(fileURLWithPath: soundURL!)
        
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer.currentTime = 0
        self.soundPlayer.volume = volSlider.value
        self.soundPlayer.numberOfLoops = -1
        self.soundPlayer.play()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.soundPlayer.stop()
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue) {}
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image=UIImage(named: "animation1.png")
        imageLayer=CALayer.init()
        imageLayer?.contents = image?.cgImage
        imageLayer?.bounds=CGRect(x: 0, y: 0, width:70, height:70)
        imageLayer?.position=CGPoint(x: 35, y: 120)
        self.view.layer.addSublayer(imageLayer!)
        
        let rotateAnimation=CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.timingFunction=CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        rotateAnimation.fromValue=0
        rotateAnimation.toValue=2*Double.pi
        
        rotateAnimation.isRemovedOnCompletion=false
        rotateAnimation.duration=1.0
        rotateAnimation.repeatCount=Float.infinity
        imageLayer?.add(rotateAnimation, forKey: nil)
        
        let moveAnimation=CABasicAnimation(keyPath: "position")
        moveAnimation.timingFunction=CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        moveAnimation.fromValue=NSValue.init(cgPoint: CGPoint(x:35,y:120))
        moveAnimation.toValue=NSValue.init(cgPoint: CGPoint(x:365,y:120))
        moveAnimation.isRemovedOnCompletion=false
        moveAnimation.duration=4.0
        moveAnimation.repeatCount=Float.infinity
        imageLayer?.add(moveAnimation,forKey: nil)
        
        
    }


}


