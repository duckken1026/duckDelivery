//
//  ViewController.swift
//  AR Quick Look Starter
//
//  Created by Sai Kambampati on 7/12/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    let models = ["wheelbarrow", "wateringcan", "teapot", "gramophone", "cupandsaucer", "redchair", "tulip", "plantpot"]
    
    var thumbnails = [UIImage]()
    var thumbnailIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for model in models {
            if let thumbnail = UIImage(named: "\(model).jpg") {
                thumbnails.append(thumbnail)
            }
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as? LibraryCollectionViewCell
        
        if let cell = cell {
            cell.modelThumbnail.image = thumbnails[indexPath.item]
            let title = models[indexPath.item]
            cell.modelTitle.text = title.capitalized
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        thumbnailIndex = indexPath.item
    }

}

