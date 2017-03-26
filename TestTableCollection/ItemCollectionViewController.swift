//
//  ItemCollectionViewController.swift
//  TestTableCollection
//
//  Created by Le Ngoc Hoan on 3/25/17.
//  Copyright © 2017 Le Ngoc Hoan. All rights reserved.
//

import UIKit

class ItemCollectionViewController: UIViewController {
    static let identifier = "ItemCollectionViewController"
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
//        collectionView.delegate = self
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ItemCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: ItemCollectionCell.identifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ItemCollectionViewController: UICollectionViewDataSource {
    private func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.identifier, for: indexPath) as! ItemCollectionCell
        cell.titleLabel.text = "C-Title"
        return cell
    }
}
