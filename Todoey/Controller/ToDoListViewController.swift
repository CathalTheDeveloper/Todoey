//
//  ViewController.swift
//  Todoey
//
//  Created by Cathal Crowley on 09/07/2019.
//  Copyright © 2019 Cathal Crowley. All rights reserved.
//
import Foundation
import UIKit

class ToDoListViewController:  UITableViewController {
    
   
    var itemArray = [item]()

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        loadItems()
        
        }

    //MARK- Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
       
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = item.title
        
        
        //Ternary operator
        //value = condtion ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done  ? .checkmark : .none
        
        if item.done == true {
            
            cell.accessoryType = .checkmark
            
        }
        else {
            cell.accessoryType = .none
            
            
        }
        
        return cell
        
    }
    
    
    //MARK- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        saveItems()
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    //MARK- Add new items.
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
    
//        let action = UIAlertAction(title: "Add item", style: UIAlertAction.Style.cancel, handler: { (UIAlertAction) in
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
        
        
         

    
//        alert.addAction(action)
        
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)

            self.saveItems()
            
            //reloads table view data
            self.tableView.reloadData()
            
        }
    
    alert.addTextField { (alertTextField) in
        
            alertTextField.placeholder = "What Needs To Be Done?"
          textField = alertTextField
            }
    
    alert.addAction(action)
      present(alert, animated: true, completion: nil)
    
    }
    
    //Mark- Model Manupulation Methods
    
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }
            
        catch {
            
            
            print("Error encoding item array, \(error)")
            
        }
        self.tableView.reloadData()
    }
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            
            let decoder = PropertyListDecoder()
            
            do {
                
            itemArray = try decoder.decode([item].self, from: data)
                
        }
            catch {
                print("ERROR")
            }
        
    }
}
    
    

}
