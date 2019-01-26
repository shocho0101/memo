//
//  ViewController.swift
//  memo
//
//  Created by 張翔 on 2019/01/26.
//  Copyright © 2019 張翔. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var saveData = UserDefaults.standard
    
    var accountNameArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        accountNameArray = saveData.object(forKey: "accountNameArray") as? [String] ?? [] //userdefaultsからアカウントの名前の配列をとってくる
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData() //tableviewが表示されたときにtableviewを更新して最新のリストにする
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = accountNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Save") as! SaveAccountViewController //StoryboardでSaveAccountViewControllerのStoryBoardのidentiferに"Save"を設定してあげる必要がある
        vc.index = indexPath.row
        present(vc, animated: true, completion: nil)
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true) //選択状態を戻してあげるやつ
    }
    
    @IBAction func createNew() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Save") as! SaveAccountViewController
        vc.createNewAccount = true
        present(vc, animated: true, completion: nil)
    }


}

