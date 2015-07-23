//
//  ViewController.swift
//  TransitionDemo02
//
//  Created by Broccoli on 15/7/22.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

let Identifier = "myCell"
class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CollectionViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.imgFace.image = UIImage(named: "face")
        cell.lblName.text = "\(indexPath.row)--cell"
        return cell
    }
}