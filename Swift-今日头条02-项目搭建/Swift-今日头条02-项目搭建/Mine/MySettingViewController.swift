//
//  MySettingViewController.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/29.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class MySettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //1.Swift方式定义一个tableView
    lazy var mySettingTableView : UITableView = {
        var tableView : UITableView = UITableView(frame: self.view.bounds, style: UITableView.Style.grouped)
        
        tableView.delegate = self
        tableView.dataSource = self;
        
        self.view.addSubview(tableView)
        return UITableView()
    }()
    
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID : String = "CELLID";
        var tableViewCell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID)
        if tableViewCell == nil {
            tableViewCell = UITableViewCell(style: .value1, reuseIdentifier: cellID);
        }
        tableViewCell!.textLabel!.text = "12345"
        
        return tableViewCell!
    }
    
    //UITableViewDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange;
        
        self.mySettingTableView.backgroundColor = UIColor.lightGray
    }
}
