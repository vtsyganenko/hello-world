//
//  ViewController3.swift
//  TestProject
//
//  Created by Виталий Цыганенко on 12.04.2023.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var actionTitleTextField: UITextField!
    @IBOutlet var actionMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showActionSheet() {
        let titleAvailable = (actionTitleTextField.text != nil && actionTitleTextField.text!.isEmpty == false)
        let messageAvailable = (actionMessageTextField.text != nil && actionMessageTextField.text!.isEmpty == false)
        
        let actionSheet = UIAlertController(
            title: titleAvailable ? actionTitleTextField.text : "Default title",
            message: messageAvailable ? actionMessageTextField.text : "Default message",
            preferredStyle: .actionSheet)
        
        let handler = { (_ action:UIAlertAction) -> Void in
            if(action.title! == "OK") {
                self.buttonOKChosen()
            }
            else if(action.title! == "Cancel") {
                self.buttonCancelChosen()
            }
            else if(action.title! == "Del") {
                self.buttonDelChosen()
            }
        }
        
        let buttonOK = UIAlertAction(title:"OK", style: .default, handler: handler)
        let buttonCancel = UIAlertAction(title:"Cancel", style: .cancel, handler: handler)
        let buttonDel = UIAlertAction(title:"Del", style: UIAlertAction.Style.destructive, handler: handler)
        
        actionSheet.addAction(buttonOK)
        actionSheet.addAction(buttonCancel)
        actionSheet.addAction(buttonDel)
        
        self.present(actionSheet, animated: true, completion: { () -> Void in
            print("action sheet is shown")
        })
    }
    
    func buttonOKChosen() {
        print("button OK chosen")
    }
    
    func buttonCancelChosen() {
        print("button Cancel chosen")
    }
    
    func buttonDelChosen() {
        print("button Del chosen")
    }
    
    @IBAction func onTapGesture() {
        actionTitleTextField.resignFirstResponder()
        actionMessageTextField.resignFirstResponder()
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
