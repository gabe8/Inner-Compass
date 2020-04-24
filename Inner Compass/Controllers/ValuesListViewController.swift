//
//  ValuesListViewController.swift
//  Inner Compass
//
//  Created by Gabriel Sereni on 4/7/20.
//  Copyright © 2020 Gabriel Sereni. All rights reserved.
//

import UIKit

class ValuesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel: UserDataModelController?
    var answerCount = 0
    var valuesHierarchyList = [String]()
    
    @IBAction func onAddTapped(_ sender: UIBarButtonItem) {
        
        // Declare object instance of UIAlertController with Add Value as title
        let alert = UIAlertController(title: "Add Value", message: nil, preferredStyle: .alert)
        
        // Add textfield to the alert window
        alert.addTextField { (valueTF) in
            valueTF.placeholder = "Enter Value"
        }
        
        // Add the add action to the alert window
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let value = alert.textFields?.first?.text else { return }
            addNewValue(value)
            // self.valuesHierarchyList.append(value)
            // self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel",
        style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true)
        
        // Add the cancel action to the alert window
        //        let cancelAction = UIAlertAction.init(title: "Cancel", style: .default) { (action) in
        //            alert.view.removeObserver(self, forKeyPath: <#String#>)
        //           }
        //        alert.addAction(cancelAction)
        
        
        //  Could use array.append(value) and tableview.reloadData() but this function allows us make items added at the top.
        func addNewValue(_ value: String) {
            let index = 0
            valuesHierarchyList.insert(value, at: index)
            
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .left)
        }
    }
    
    //    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    //
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel = UserDataModelController()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Enable the table view to utilize drag and drop functionality.
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        
        
        // Take the stored array of survey answers, then generate new array without blanks for values hiearchy list
        if let valuesArray = dataModel?.storedUserData() {
            //print("This is the stored array:")
            //dump(valuesArray)
            for question in valuesArray {
                //print("here is the question value looped through:")
                //print(question)
                for (answerNumber, answer) in question {
                    //print("\(answerNumber) is \(answer)")
                    if !answer.isEmpty {
                        valuesHierarchyList.append(answer)
                    }
                }
                
            }
        } else {
            print("This loop didn't work")
        }
        print("Here is the values list after going through the loop:")
        dump(valuesHierarchyList)
        
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

extension ValuesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valuesHierarchyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valueCell", for: indexPath)
        cell.textLabel?.text = valuesHierarchyList[indexPath.row]
        cell.backgroundColor = UIColor(red: CGFloat.random(in: 0...1),
                                       green: CGFloat.random(in: 0...1),
                                       blue: CGFloat.random(in: 0...1),
                                       alpha: 0.1)
        return cell
    }
}


extension ValuesListViewController: UITableViewDelegate {
    
    // Allows rows to move in editing mode
    //    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //        let movedObjTemp = valuesHierarchyList[sourceIndexPath.item]
    //        valuesHierarchyList.remove(at: sourceIndexPath.item)
    //        valuesHierarchyList.insert(movedObjTemp, at: destinationIndexPath.item)
    
    
    //    }
    
    // Turned off shouldIndentWhileEditingRowAt to hide the red "-" buttons to the left in editing mode
    //    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    //        return false
    //    }
    
    // Turned off editingStyleForRowAt to hide the red "-" buttons to the left in editing mode
    //    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    //        return .none
    //    }
    
    // Tells the data source where to move the row after actions are triggered in the drag/drop delegate functions
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedObjTemp = valuesHierarchyList[sourceIndexPath.item]
        valuesHierarchyList.remove(at: sourceIndexPath.item)
        valuesHierarchyList.insert(movedObjTemp, at: destinationIndexPath.item)
    }
    
    
    //    // Enable the swipe to delete feature for the table (outside of editing mode)
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            valuesHierarchyList.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        }
    //
    //    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Creates the swipe delete functionality and actions - this uses more streamlined code then the edit functionality
        // which does pretty much the same thing but edits instead of deletes
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete Value", message: "Are you sure you want to delete this value?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (alertAction) in
                self.valuesHierarchyList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true)
            
        }
        
        // Creates the swipe edit button functionality and actions
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action, view, nil) in
            
            // Create the alert window
            let alert = UIAlertController(title: "Edit your value",
                                          message: "Edit the selected value below",
                                          preferredStyle: .alert)
            
            let editAction = UIAlertAction(title: "Save", style: .default) { (action) in
                guard let textfield = alert.textFields?.first else {
                    return
                }
                if let textToEdit = textfield.text {
                    if textToEdit.count == 0 {
                        return
                    }
                    self.valuesHierarchyList[indexPath.row] = textToEdit
                    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                } else {
                    return
                }
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .default)
            alert.addTextField()
            guard let textField = alert.textFields?.first else {
                return
            }
            textField.placeholder = "Modify your value:"
            alert.addAction(cancelAction)
            alert.addAction(editAction)
            self.present(alert, animated: true)
        }
        edit.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
}

extension ValuesListViewController: UITableViewDragDelegate, UITableViewDropDelegate {
    
    // Detect and set the row int the table to be dragged
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
    
    // On stackoverflow they said this function is not even necessary but keeping here in case I need to alter.
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        
        if session.localDragSession != nil { // Drag originated from the same app.
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    }
}
