//
//  Point.swift
//  SwiftPi
//
//  Created by Josselin Abel on 11/01/2021.
//

import UIKit

struct Point {
    let pointCenter: CGPoint
    let lineWidth: CGFloat
    let circleRadius: CGFloat
    let circleCenter: CGPoint
    
    var pathForPoint: UIBezierPath {
        let path = UIBezierPath(arcCenter: pointCenter, radius: 1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    var color: UIColor {
        let d: CGFloat = pow(pointCenter.x - circleCenter.x, 2) + pow(pointCenter.y - circleCenter.y, 2)
        let r: CGFloat = pow(circleRadius, 2)
        if d <= r {
            return UIColor.green
        }else{
            return UIColor.red
        }
    }
    
    var isInCircle: Bool {
        let d: CGFloat = pow(pointCenter.x - circleCenter.x, 2) + pow(pointCenter.y - circleCenter.y, 2)
        let r: CGFloat = pow(circleRadius, 2)
        if d <= r {
            return true
        }else{
            return false
        }
    }
}
