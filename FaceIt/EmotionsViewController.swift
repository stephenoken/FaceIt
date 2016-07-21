//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Stephen O'Kennedy on 19/07/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    
    private let emotionalFaces:Dictionary<String,FacialExpression>=[
        "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Smirk),
        "mischievious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
    ]

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinaitonVC = segue.destinationViewController
        if let navCon = destinaitonVC as? UINavigationController {
            destinaitonVC = navCon.visibleViewController ?? destinaitonVC
        }
        //Type Casting
        if let faceVC = destinaitonVC as? FaceViewController {
            if let identifier = segue.identifier{
                if let expression = emotionalFaces[identifier]{
                    faceVC.expression = expression
                    if let sendingButton = sender as? UIButton {
                        faceVC.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }

}
