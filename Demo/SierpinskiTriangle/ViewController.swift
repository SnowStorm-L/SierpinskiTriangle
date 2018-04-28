//
//  ViewController.swift
//  SierpinskiTriangle
//
//  Created by L on 2018/4/19.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let siperpinskiTriangleView = SierpinskiTriangleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        siperpinskiTriangleView.backgroundColor = .white
        
        let width = view.frame.size.width
        let height = sqrt(pow(view.frame.size.width, 2) * 4/3)
    
        siperpinskiTriangleView.frame = CGRect(x: 0, y: 50, width: width, height: height)
        view.addSubview(siperpinskiTriangleView)
        
        view.backgroundColor = .green
        
        siperpinskiTriangleView.drawSierpinskiTriangleIterationMethod()
        
        //siperpinskiTriangleView.drawSierpinskiTriangleRecursiveMethod(centerPoint: siperpinskiTriangleView.center, r: sqrt(3)/6 * width)
        
     
    }
 
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

