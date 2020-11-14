//
//  ViewController.swift
//  BigO
//
//  Created by AaronYin on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(fib2(6))
//        print(fib2(7))
//        print(fib2(8))
        
        performanceMeasure {
            _ = fib1(45)
        }
        
        performanceMeasure {
            _ = fib2(45)
        }
        
    }


}

