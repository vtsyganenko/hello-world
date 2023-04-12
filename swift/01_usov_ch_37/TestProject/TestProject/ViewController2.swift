//
//  ViewController2.swift
//  TestProject
//
//  Created by Виталий Цыганенко on 10.04.2023.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var alertTitleTextField: UITextField!
    @IBOutlet var alertMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("ViewController2::onUnwindAction")
    }
    
    @IBAction func showAlert() {
        let titleAvailable = (alertTitleTextField.text != nil && alertTitleTextField.text!.isEmpty == false)
        let messageAvailable = (alertMessageTextField.text != nil && alertMessageTextField.text!.isEmpty == false)
        
        let alert = UIAlertController(
            title: titleAvailable ? alertTitleTextField.text : "Default title",
            message: messageAvailable ? alertMessageTextField.text : "Default message",
            preferredStyle: .alert)
        
        let handler1 = { (_ action:UIAlertAction) -> Void in
            print("alert: button OK is chosen")
        }
        
        let handler2 = { (_ action:UIAlertAction) -> Void in
            print("alert: button", action.title!, "is chosen")
        }
        
        let buttonOK = UIAlertAction(title:"OK", style: .default, handler: handler1)
        let buttonCancel = UIAlertAction(title:"Cancel", style: .cancel, handler: handler2)
        let buttonDel = UIAlertAction(title:"Del", style: UIAlertAction.Style.destructive,
                                      handler: { (_ action:UIAlertAction) -> Void in
            print("alert: button", action.title!, "is chosen")
        })
        
        alert.addAction(buttonOK)
        alert.addAction(buttonCancel)
        alert.addAction(buttonDel)
        
        self.present(alert, animated: true, completion:
                        { () -> Void in
            print("alert is shown")
        })
    }
    
    @IBAction func onTapGesture() {
        alertTitleTextField.resignFirstResponder()
        alertMessageTextField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
