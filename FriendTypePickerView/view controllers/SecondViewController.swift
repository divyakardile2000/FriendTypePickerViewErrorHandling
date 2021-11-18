//
//  SecondViewController.swift
//  FriendTypePickerView
//
//  Created by Mac on 08/10/21.
//

import UIKit

class SecondViewController: UIViewController {
// enum for possible error cases
    enum InputTextFieldErrors:Error{
        case InvalidFriendType
    }
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    weak var secondViewControllerDelegate:SecondViewControllerProtocol?
    func validatingInput()throws{
        
        guard let fType = typeTF.text else {
            print("type not found")
            return
        }
        if fType == "BEST FRIEND" || fType == "FRIEND" || fType == "GIRL FRIEND" || fType == "BOY FRIEND"{
            secondViewControllerDelegate?.passData(typeTF.text, nameTF.text, addressTF.text)
            navigationController?.popViewController(animated: true)
        }else{
            throw InputTextFieldErrors.InvalidFriendType
        }
    }
    
//MARK: doneBtnAction
    @IBAction func doneBtnAction(){
        do{
            try validatingInput()
        } catch InputTextFieldErrors.InvalidFriendType{
            let alert = UIAlertController(title: "Warning", message:"Invalid type : it must be BEST FRIEND , GIRL FRIEND , BOY FRIEND or FRIEND", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } catch{
            let alert = UIAlertController(title: "Alert", message: "try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "second page"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(doneBtnAction))
    }
}
//MARK:Protocol
protocol SecondViewControllerProtocol : class {
    func passData(_ type:String?,_ name:String?,_ address:String?)
}
