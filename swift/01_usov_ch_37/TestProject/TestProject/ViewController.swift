//
//  ViewController.swift
//  TestProject
//
//  Created by Виталий Цыганенко on 10.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!

    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("ViewController::onUnwindAction")
    }
    
    @IBAction func textToLog() {
        print("ViewController: ", textField.text!)
    }
    
    @IBAction func textToLabel() {
        label.text = textField.text
    }
    
    @IBAction func onTapGesture() {
        textField.resignFirstResponder()
    }

    @IBAction func changeLabelText(_ sender: UIButton) {
        if let buttonText = sender.titleLabel!.text {
            self.myLabel.text = buttonText
            print("\(buttonText) was pressed")
        }
    }
    
}

