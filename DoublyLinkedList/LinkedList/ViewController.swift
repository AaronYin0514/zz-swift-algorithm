//
//  ViewController.swift
//  LinkedList
//
//  Created by AaronYin on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let link: LinkedList<Int> = [1, 2, 3, 4, 5, 6, 7, 8]
        print(link)
        print(link[6])
        
    }


}

