//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/10/22.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants: [Restaurant] = []
    
    
    // MARK: - Table view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Restaurant.generateData(sourceArray: &restaurants)

        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name //optioinal chaining
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        
        if restaurants[indexPath.row].isVisited {
        cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = .none
        }

        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
         
        return cell
    }
    

 //   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        // Add Call action
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//        // Check-in action
//        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//        optionMenu.addAction(checkInAction)
//
//        //add undo check-in action
//        let uncheckInAction = UIAlertAction(title: "Undo Check in", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath)
//            if self.restaurantIsVisited[indexPath.row] {  //if ckecked
//                cell?.accessoryType = .none
//                self.restaurantIsVisited[indexPath.row] = false
//            }
//        })
//        optionMenu.addAction(uncheckInAction)
//
//
//
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//
//        // Display the menu
//        present(optionMenu, animated: true, completion: nil)
//
//        // Deselect a row
//        tableView.deselectRow(at: indexPath, animated: false)
        
        
 //   }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
    
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completion handler with true to indicate
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name

            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        // Set the icon and background color for the actions
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        return swipeConfiguration
    }
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
    let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
                
    let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
        self.restaurants[indexPath.row].isVisited = (self.restaurants[indexPath.row].isVisited) ? false : true
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
                
    completionHandler(true)
    }
            
        let checkInIcon = restaurants[indexPath.row].isVisited ? "arrow.uturn.left" : "checkmark"
    checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
    checkInAction.image = UIImage(systemName: checkInIcon)
            
    let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
          
            
    return swipeConfiguration
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "showRestaurantDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let destinationController = segue.destination as! RestaurantDetailViewController
            destinationController.restaurant = restaurants[indexPath.row]
        }
      }
    }

    
    

}
