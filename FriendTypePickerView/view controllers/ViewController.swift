//
//  ViewController.swift
//  FriendTypePickerView
//
//  Created by Mac on 08/10/21.
//

import UIKit
class ViewController: UIViewController,SecondViewControllerProtocol {
    //MARK: protocol method
    func passData(_ type: String?, _ name: String?, _ address: String?) {
        guard let typeValue = type else {
            return
        }
        guard let nameValue = name else {
            return
        }
        guard let addressValue = address else{
            return
        }
        friendArray.append(Friend(type: typeValue, name: nameValue, address: addressValue))
        tableView.reloadData()
    }
//MARK: addBtnAction
    @IBAction func addBtnAction(_ sender: Any) {
        if let secondViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as? SecondViewController{
            secondViewControllerObj.secondViewControllerDelegate = self
            navigationController?.pushViewController(secondViewControllerObj, animated: true)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    //array which store new added products
    var friendArray:[Friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first page"
        let nibFile = UINib(nibName: "XibTableViewCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: "XibTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friends = friendArray[indexPath.row]
        if friends.type == "BEST FRIEND"{
            let bestFrdCell = tableView.dequeueReusableCell(withIdentifier: "XibTableViewCell", for: indexPath)as! XibTableViewCell
            bestFrdCell.typelabel.text = friends.type
            bestFrdCell.nameLabel.text = friends.name
            bestFrdCell.addressLabel.text = friends.address
            return bestFrdCell
        }else{
            let noramalFrdCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)as! CustomTableViewCell
            noramalFrdCell.typeLabelC.text = friends.type
            noramalFrdCell.nameLabelC.text = friends.name
            noramalFrdCell.addressLabelC.text = friends.address
            return noramalFrdCell
        }
    }
}

