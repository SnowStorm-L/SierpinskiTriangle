//
//  SierpinskiTriangleView.swift
//  SierpinskiTriangleView
//
//  Created by L on 2018/4/19.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class SierpinskiTriangleView: UIView {
    
    var bezierPath = UIBezierPath()
    var shapeLayer = CAShapeLayer()
  
}

extension SierpinskiTriangleView {
    
    func drawSierpinskiTriangleRecursiveMethod(centerPoint: CGPoint, r: CGFloat) {
        
        let x = centerPoint.x
        let y = centerPoint.y
        
        let p1 = CGPoint(x: x + r * cos(-.pi/2), y: y + r * sin(-.pi/2))
        let p2 = CGPoint(x: x + r * cos(.pi/6), y: y + r * sin(.pi/6))
        let p3 = CGPoint(x: x + r * cos(.pi/6*5), y: y + r * sin(.pi/6*5))
        
        //drawSkeleton(centerPoint: centerPoint, p1: p1, p2: p2, p3: p3)
        
        if r < 10 {
            drawTrangle(centerPoint: p1, r: r)
            drawTrangle(centerPoint: p2, r: r)
            drawTrangle(centerPoint: p3, r: r)
            return
        }
        
        drawSierpinskiTriangleRecursiveMethod(centerPoint: p1, r: r/2)
        drawSierpinskiTriangleRecursiveMethod(centerPoint: p2, r: r/2)
        drawSierpinskiTriangleRecursiveMethod(centerPoint: p3, r: r/2)
    }
    
    private func drawTrangle(centerPoint: CGPoint, r: CGFloat) {
        let x = centerPoint.x
        let y = centerPoint.y
        let p1 = CGPoint(x: x + r * cos(-.pi/2), y: y + r * sin(-.pi/2))
        let p2 = CGPoint(x: x + r * cos(.pi/6), y: y + r * sin(.pi/6))
        let p3 = CGPoint(x: x + r * cos(.pi/6*5), y: y + r * sin(.pi/6*5))
        bezierPath.move(to: p1)
        bezierPath.addLine(to: p2)
        bezierPath.addLine(to: p3)
        bezierPath.close()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    private func drawSkeleton(centerPoint: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) {
        let path = UIBezierPath()
        path.move(to: centerPoint)
        path.addLine(to: p1)
        path.move(to: centerPoint)
        path.addLine(to: p2)
        path.move(to: centerPoint)
        path.addLine(to: p3)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(shapeLayer)
    }
    
}

extension SierpinskiTriangleView {
    
    func drawSierpinskiTriangleIterationMethod() {
        
        //        迭代思路(对照工程图片Iteration.jpg查看)
        //        1, 以等概率(1/3)取三角形任意一点顶点Point1
        //        2, 重复第一步, 得到三角形任意一点顶点Point2
        //        3, 取Point1, Point2的中点 作为新的Point3, 画出Point3
        //        4, 重复步骤2,3, 直到希望停止
        
        let topPoint = CGPoint(x: 0, y: 0)
        let bottomPoint = CGPoint(x: 0, y: frame.height)
        let rightPoint = CGPoint(x: frame.width, y: frame.height / 2)
        
        let pointArray = [topPoint, bottomPoint, rightPoint]
        
        var index: Int = Int(arc4random() % 3)
        
        var point = pointArray[index]
        
        for idx in 1 ..< 80000 {
            index = Int(arc4random() % 3)
            point.x = (point.x + pointArray[index].x) / 2.0
            point.y = (point.y + pointArray[index].y) / 2.0
            let nextPoint = CGPoint(x: point.x, y: point.y)
            bezierPath.move(to: point)
            bezierPath.addArc(withCenter: nextPoint, radius: 0.1, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            print("finish____\(idx)")
        }
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(shapeLayer)
    }
    
}

private extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat (arc4random()%256)/255.0
            let green = CGFloat (arc4random()%256)/255.0
            let blue = CGFloat (arc4random()%256)/255.0
            return UIColor (red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

