//
//  SaveAccountViewController.swift
//  memo
//
//  Created by 張翔 on 2019/01/26.
//  Copyright © 2019 張翔. All rights reserved.
//

import UIKit

class SaveAccountViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    var createNewAccount = false //アカウントを追加するかどうか
    var index: Int? //前の画面から情報をもらう　!から?に変えてあります
    
    let saveData = UserDefaults.standard
    
    var accountNameArray: [String] = []
    var mailArray: [String] = []
    var passArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //それぞれのデータの配列をStoryboardからとってくる
        accountNameArray = saveData.object(forKey: "accountNameArray") as? [String] ?? []
        mailArray = saveData.object(forKey: "mailArray") as? [String] ?? []
        passArray = saveData.object(forKey: "passArray") as? [String] ?? []
        
        // Do any additional setup after loading the view.
        if createNewAccount == false {
            nameTextField.text = accountNameArray[index!]
            mailTextField.text = mailArray[index!]
            passTextField.text = passArray[index!]
        }
    }
    
    @IBAction func saveMemo() {
        if createNewAccount {
            accountNameArray.append(nameTextField.text!)
            mailArray.append(mailTextField.text!)
            passArray.append(passTextField.text!)
        } else {
            accountNameArray[index!] = nameTextField.text!
            mailArray[index!] = mailTextField.text!
            passArray[index!] = passTextField.text!
        }
        
        saveData.set(accountNameArray, forKey: "accountNameArray")
        saveData.set(mailArray, forKey: "mailArray")
        saveData.set(passArray, forKey: "passArray")
        
        let alert = UIAlertController(title: "保存", message: "保存されました", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
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
