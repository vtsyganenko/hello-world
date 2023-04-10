//
//  ViewController.swift
//  TestProject
//
//  Created by Виталий Цыганенко on 10.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("ViewController::onUnwindAction")
    }

}

