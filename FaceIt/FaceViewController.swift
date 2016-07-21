//
//  ViewController.swift
//  FaceIt
//
//  Created by Stephen O'Kennedy on 09/07/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    var expression = FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Smirk){
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(
                target: faceView, action: #selector(FaceView.changeScale(_:))))
            
            let happierSwipeGestureRecogniser = UISwipeGestureRecognizer(target: self, action: #selector(FaceViewController.increaseHappiness))
            happierSwipeGestureRecogniser.direction = .Up
            faceView.addGestureRecognizer(happierSwipeGestureRecogniser)
            let sadderSwipeGestureRecogniser = UISwipeGestureRecognizer(target: self, action: #selector(FaceViewController.decreaseHappiness))
            sadderSwipeGestureRecogniser.direction = .Down
            faceView.addGestureRecognizer(sadderSwipeGestureRecogniser)
            
//            faceView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(FaceViewController.changeBrows)))
            
            updateUI()
        }
    }
    
    @IBAction func changeBrows(recogniser: UIRotationGestureRecognizer) {
        if recogniser.state == .Ended {
            switch recogniser.rotation {
            case let x where x > 0.0:
                expression.eyeBrows = expression.eyeBrows.moreFurrowed()
            case let x where x < 0.0:
                expression.eyeBrows = expression.eyeBrows.moreRelaxed()
            default:
                break
            }
        }
    }
    @IBAction func toogleEyes(recogniser: UITapGestureRecognizer) {
        if recogniser.state == .Ended {
            switch expression.eyes {
            case .Open:
                expression.eyes = .Closed
            case .Closed:
                expression.eyes = .Open
            case .Squinting :
                break
            }
        }
    }
    func increaseHappiness() {
        expression.mouth = expression.mouth.happierMouth()
    }
    
    func decreaseHappiness() {
        expression.mouth = expression.mouth.sadderMouth()
    }
    private let mouthCurvatures = [FacialExpression.Mouth.Frown: -1.0,.Grin: 0.5,.Smile: 1.0,.Smirk: -0.5,.Neutral: 0.0]
    private let eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed:0.5,.Furrowed:-0.5,.Normal:0.0]
    
    private func updateUI() {
        if faceView != nil{
            
            switch expression.eyes {
            case .Open : faceView.eyeOpen = true
            case .Closed : faceView.eyeOpen = false
            case .Squinting : faceView.eyeOpen = false
            }
            
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
            faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
        }
    }
    
    
}

