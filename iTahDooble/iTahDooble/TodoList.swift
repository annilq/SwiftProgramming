//
//  TodoList.swift
//  iTahDooble
//
//  Created by annilq on 2020/4/29.
//  Copyright © 2020 annilq. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private let fileURL:URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryUrl = documentDirectoryURLs.first!
        return documentDirectoryUrl.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items:[String]=[]
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        if !itemsArray.write(to: fileURL, atomically: true){
            print("could not save todo items")
        }
    }
    
    func loadItems()  {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String]{
            items = itemsArray
        }
    }
    
    func add(_ item:String) {
        items.append(item)
        saveItems()
    }
    
    func remove(at index:Int) {
        items.remove(at: index)
        saveItems()
    }
    
}

extension TodoList:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            remove(at: indexPath.row)
        default:
            print("can't perform this operation")
        }
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
