//
//  ViewController.swift
//  beastlist
//
//  Created by Omar Ihmoda on 1/12/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks: [String] = []
    
    @IBOutlet weak var textFieldAdd: UITextField!
    
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func buttonAddPressed(_ sender: UIButton) {
        
        if let new_task = self.textFieldAdd.text {
            self.tasks.append(new_task)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: self.tasks.count-1, section: 0)], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = self.tasks[indexPath.row]
        return cell
    }

}



