//
//  FacialExpression.swift
//  FaceIt
//
//  Created by Stephen O'Kennedy on 12/07/2016.
//  Copyright © 2016 Stephen O'Kennedy. All rights reserved.
//

import Foundation

struct FacialExpression {
    
    enum Eyes:Int {
        case Open,Closed,Squinting
    }
    
    enum EyeBrows: Int {
        case Relaxed,Normal,Furrowed
        
        func moreRelaxed() -> EyeBrows {
            return EyeBrows(rawValue: rawValue - 1) ?? .Relaxed
        }
        
        func moreFurrowed() -> EyeBrows {
            return EyeBrows(rawValue:  rawValue + 1) ?? .Furrowed
        }
    }
    
    enum Mouth:Int {
        case Frown, Smirk, Neutral, Grin, Smile
        
        func sadderMouth() -> Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .Frown
        }
        
        func happierMouth() -> Mouth {
            return Mouth(rawValue: rawValue + 1) ?? .Smile
        }
    }
    
    var eyes:Eyes
    var eyeBrows:EyeBrows
    var mouth:Mouth
}