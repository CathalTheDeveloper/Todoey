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

    
    let defaults = UserDefaults.standard
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       

        let newItem = item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = item()
        newItem.title = "BuyEggos"
      itemArray.append(newItem2)
        
        let newItem3 = item()
        newItem.title = "Destroy Demogorgon"
    itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [item] {
            
            itemArray = items
            
        }
        
        }

    
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
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        
       
//        print(itemArray[indexPath.row])
        
        //adds checkmark when cell is selected
        
        //updates the data
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    //MARK- Add new items.
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)

            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            
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
    
    
}
