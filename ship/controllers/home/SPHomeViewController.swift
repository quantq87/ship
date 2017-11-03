//
//  SPHomeViewController.swift
//  ship
//
//  Created by tran.quoc.quan on 11/3/17.
//  Copyright © 2017 tran.quoc.quan. All rights reserved.
//

import UIKit

class SPHomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var mainTableView: SPMainTableView!
    var mainCollectionView: SPMainCollectionView!
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        mainTableView = SPMainTableView(frame: view.frame, style: .plain)
        mainTableView.backgroundColor = .red
        view.addSubview(mainTableView)
        
        let collectionFrame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y + 64, width: view.frame.width, height: view.frame.height - 64)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: collectionFrame.width - 10, height: 60)
        
        mainCollectionView = SPMainCollectionView(frame: collectionFrame, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .green
        mainCollectionView?.register(PackageCell.self, forCellWithReuseIdentifier: cellId)
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        view.addSubview(mainCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}

class PackageCell: UICollectionViewCell {
    
    //this gets called when a cell is dequeued
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST TEST TEST"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        backgroundColor = .yellow
        
        addSubview(wordLabel)
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
