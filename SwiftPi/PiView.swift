//
//  PiView.swift
//  SwiftPi
//
//  Created by Josselin Abel on 04/01/2021.
//

import UIKit

@IBDesignable
class PiView: UIView {
    @IBInspectable var scale: CGFloat = 0.9
    private var circleRadius: CGFloat {return min(bounds.size.width, bounds.size.height) / 2 * scale}
    private var circleCenter: CGPoint {return CGPoint(x: bounds.midX, y: bounds.midY)}
    var lineWidth: CGFloat = 3.0
    @IBInspectable var lineColor: UIColor = UIColor.blue {didSet {setNeedsDisplay()}}
    private var pointTableau: [Point] = []
    var nbPointTotal: Int = 0
    var nbPointInCircle: Int = 0
    
    private func pathForCircle() -> UIBezierPath {
        let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    func pathForSquare() -> UIBezierPath {
        let path = UIBezierPath()
        let startX = circleCenter.x - circleRadius
        let startY = circleCenter.y - circleRadius 

        path.move(to: CGPoint(x: startX, y: startY))

        path.addLine(to: path.currentPoint)
        path.addLine(to: CGPoint(x: startX + circleRadius*2, y: startY))
        path.addLine(to: path.currentPoint)
        path.addLine(to: CGPoint(x: startX + circleRadius*2, y: startY + circleRadius*2))
        path.addLine(to: path.currentPoint)
        path.addLine(to: CGPoint(x: startX, y: startY + circleRadius*2))
        path.addLine(to: path.currentPoint)
        path.lineWidth = lineWidth
        path.close()
        return path
    }
    
    @objc func drawPoint(nbPoint: Int) {
        nbPointTotal = nbPoint
        nbPointInCircle = 0
        
        let startX = Int(circleCenter.x - circleRadius)
        let startY = Int(circleCenter.y - circleRadius)
        let endX = Int(circleCenter.x + circleRadius)
        let endY = Int(circleCenter.y + circleRadius)
        
        if nbPointTotal > 1 {
            pointTableau.removeAll()
            for _ in 1...nbPointTotal {
                let x = Int.random(in: startX..<endX)
                let y = Int.random(in: startY..<endY)
                let pointCenter = CGPoint(x: x, y: y)
                let point = Point(pointCenter: pointCenter, lineWidth: lineWidth, circleRadius: circleRadius, circleCenter: circleCenter)
                if point.isInCircle {
                    nbPointInCircle = nbPointInCircle + 1
                }
                pointTableau.append(point)
            }
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        lineColor.set()
        pathForCircle().stroke()
        pathForSquare().stroke()
        
        if nbPointTotal > 1 {
            for dot in pointTableau {
                dot.color.set()
                dot.pathForPoint.stroke()
            }
        }
    }
    
    
}
