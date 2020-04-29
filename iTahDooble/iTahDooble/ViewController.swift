//
//  ViewController.swift
//  iTahDooble
//
//  Created by annilq on 2020/4/29.
//  Copyright © 2020 annilq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField:UITextField!
    @IBOutlet var insertButton:UIButton!
    @IBOutlet var tableView:UITableView!
    
    let todolist = TodoList()
    
    @IBAction func insert(_ sender:UIButton){
        guard let content = itemTextField.text else {
            return
        }
        todolist.add(content)
        tableView.reloadData()
        itemTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todolist
    }


}

