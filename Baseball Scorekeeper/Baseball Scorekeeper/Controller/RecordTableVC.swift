//
//  RosterVC.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/15/21.
//

import UIKit

class RecordTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        return table
    }()
    
    let alienArray = [String](repeating: "👽 invading  🌎", count: 100)
    
    // Put the pieces together
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        table.register(RecordCell.self, forCellReuseIdentifier: "RecordCell")
        
        table.delegate = self
        table.dataSource = self
    }
    
    // Stuff for UITableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alienArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(alienArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hello", message: "You've tapped in the \(indexPath.row) row, from section \(indexPath.section)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
