//
//  ToDoList.swift
//  ToDoList
//
//  Created by Dinos Tsiounis on 8/4/20.
//  Copyright © 2020 Konstantinos Tsiounis. All rights reserved.
//

import UIKit

class ToDoList: NSObject {
    
    private let fileUrl: URL = {
        let documentDictionaryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDictionaryURL = documentDictionaryURLs.first!
        return documentDictionaryURL.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving Array of Files")
        if !itemsArray.write(to: fileUrl, atomically: true) {
            print("Could not save items")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileUrl) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }

}

extension ToDoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            items.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
}
