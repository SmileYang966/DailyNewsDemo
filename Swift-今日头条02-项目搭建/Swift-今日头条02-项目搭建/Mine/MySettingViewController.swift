//
//  MySettingViewController.swift
//  Swift-今日头条02-项目搭建
//
//  Created by Evan Yang on 2020/1/29.
//  Copyright © 2020 Evan Yang. All rights reserved.
//

import UIKit

class MySettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var sections = [[MyCellModel]]()
    
    //1.Swift方式定义一个tableView
    lazy var mySettingTableView : UITableView = {
        var tableView : UITableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        
        tableView.delegate = self
        tableView.dataSource = self;
        //自定义一个XIB类型的UITableViewCell
        tableView.register(UINib(nibName: String(describing: SCMineSettingTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SCMineSettingTableViewCell.self))
        //自定义一个XIB类型的关注cell
        tableView.register(UINib(nibName: String(describing: SCMyConcernTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SCMyConcernTableViewCell.self))
        //隐藏没必要的footerView
        tableView.tableFooterView = UIView()
        
        self.view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orange
        self.mySettingTableView.backgroundColor = UIColor.lightGray
        
        //获取cell的数据
        NetworkTool.loadMyCellData { (sectionsFromNetwork) in
            self.sections = sectionsFromNetwork
            print("1--current Thread is \(Thread.current)")
            DispatchQueue.main.async {
                print("2--current Thread is \(Thread.current)")
                self.mySettingTableView.reloadData()
                self.mySettingTableView.backgroundColor = UIColor.lightGray
            }
        }
    }
}

extension MySettingViewController{
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //使用自定义的XIB类型的cell，直接根据Identifier去取相应的cell
        if indexPath.section == 0 && indexPath.row == 0 {
            let concernCell : SCMyConcernTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SCMyConcernTableViewCell.self)) as! SCMyConcernTableViewCell
            
            return concernCell
        }
        
        let tableViewCell : SCMineSettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SCMineSettingTableViewCell.self)) as! SCMineSettingTableViewCell
        let sectionArray : [MyCellModel] = self.sections[indexPath.section]
        let cellItem : MyCellModel = sectionArray[indexPath.row]
        
        tableViewCell.leftLabel!.text = cellItem.text
        tableViewCell.rightLabel.text = cellItem.grey_text
        
        return tableViewCell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 20.0))
        headerView.backgroundColor = UIColor.init(red: 247/255.0, green: 248/255.0, blue: 249/255.0, alpha: 1.0)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0{
            return 150.0
        }
        return 44.0
    }
}
