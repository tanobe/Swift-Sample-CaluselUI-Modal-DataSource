//
//  TestUITableViewCell.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2021/11/19.
//

import UIKit


class TestUITableViewCell: UIViewController {
    var tableView: UITableView?
    let items = ["Apple","Banana","Orange"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            self.view.addSubview(tableView)
            return tableView
            
        }()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")

      cell.textLabel?.text = self.items[indexPath.row]

      return cell

    }
    
}
