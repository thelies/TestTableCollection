//
//  ViewController.swift
//  TestTableCollection
//
//  Created by Le Ngoc Hoan on 3/25/17.
//  Copyright © 2017 Le Ngoc Hoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    lazy var itemCollectionVC: ItemCollectionViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: ItemCollectionViewController.identifier) as! ItemCollectionViewController
        return viewController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: ItemCell.identifier, bundle: nil), forCellReuseIdentifier: ItemCell.identifier)
        addHeaderViewForTable()
        
        let leftImage = UIImage(named: "Undo")
        let rightImage = UIImage(named: "Redo")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(tapLeftButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(tapRightButton))
        self.navigationItem.title = "Nav title"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHeaderViewForTable() {
        let headerView = Bundle.main.loadNibNamed(HeaderCollectionView.identifier, owner: self, options: nil)?[0] as! HeaderCollectionView
        headerView.title1Label.text = "This is title1"
        headerView.title2Label.text = "This is title2"
        headerView.frame.size.height = 165
        itemCollectionVC.view.frame = headerView.collectionContainerView.bounds
        itemCollectionVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.collectionContainerView.addSubview(itemCollectionVC.view)
        
        tableView.tableHeaderView = headerView
    }
    
    func tapLeftButton() {
        print("🔵Tap Left Button")
    }
    
    func tapRightButton() {
        print("🔴Tap Right Button")
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier) as! ItemCell
        cell.titleLabel.text = "T-Title"
        return cell
    }
}
