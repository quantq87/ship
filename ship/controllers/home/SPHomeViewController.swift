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
        layout.itemSize = CGSize(width: collectionFrame.width - 10, height: 120)
        
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
    
    let statusButton:UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.backgroundColor = .gray
        button.setTitle("Action status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
        return button
    }()
    
    let packageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "#ABC15C2"
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let customerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chi Dung"
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let addressNameLabel: UILabel = {
        let label = UILabel()
        label.text = "123/23/24 Le Duan, Phuong Ben Thanh, Quan 1, TP HCM"
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.backgroundColor = .blue
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "03/11/2017"
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let payTotalImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let payTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "300.000 VND"
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupViews() {
        backgroundColor = .yellow
        
        addSubview(packageNameLabel)
        packageNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        packageNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        packageNameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        packageNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Customer
        addSubview(customerImageView)
        customerImageView.topAnchor.constraint(equalTo: packageNameLabel.bottomAnchor).isActive = true
        customerImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        customerImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        customerImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(customerNameLabel)
        customerNameLabel.topAnchor.constraint(equalTo: packageNameLabel.bottomAnchor).isActive = true
        customerNameLabel.leftAnchor.constraint(equalTo: customerImageView.rightAnchor).isActive = true
        customerNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        customerNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Address
        addSubview(addressImageView)
        addressImageView.topAnchor.constraint(equalTo: customerImageView.bottomAnchor).isActive = true
        addressImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        addressImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        addressImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(addressNameLabel)
        addressNameLabel.topAnchor.constraint(equalTo: customerImageView.bottomAnchor).isActive = true
        addressNameLabel.leftAnchor.constraint(equalTo: addressImageView.rightAnchor).isActive = true
        addressNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addressNameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Info
        addSubview(dateImageView)
        dateImageView.topAnchor.constraint(equalTo: addressImageView.bottomAnchor).isActive = true
        dateImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dateImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dateImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: addressImageView.bottomAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dateImageView.rightAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        addSubview(payTotalImageView)
        payTotalImageView.topAnchor.constraint(equalTo: addressImageView.bottomAnchor).isActive = true
        payTotalImageView.leftAnchor.constraint(equalTo: dateLabel.rightAnchor).isActive = true
        payTotalImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        payTotalImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(payTotalLabel)
        payTotalLabel.topAnchor.constraint(equalTo: addressImageView.bottomAnchor).isActive = true
        payTotalLabel.leftAnchor.constraint(equalTo: payTotalImageView.rightAnchor).isActive = true
        payTotalLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        payTotalLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        addSubview(statusButton)
        statusButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        statusButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        statusButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
