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
        var tableView : UITableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        
        tableView.delegate = self
        tableView.dataSource = self;
        
        self.view.addSubview(tableView)
        return UITableView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange;
        
        self.mySettingTableView.backgroundColor = UIColor.lightGray
    }
}

extension MySettingViewController{
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 20.0))
        headerView.backgroundColor = UIColor.init(red: 247/255.0, green: 248/255.0, blue: 249/255.0, alpha: 1.0)
        return headerView
    }
}
