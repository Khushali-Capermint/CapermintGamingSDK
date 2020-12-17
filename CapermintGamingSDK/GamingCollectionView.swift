//
//  GamingCollectionView.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 16/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit

class GamingCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var aryImages : [UIImage] = [bundledImage(named: "Hyper Hockey"), bundledImage(named: "Tic Tac Toe"), bundledImage(named: "marvel bird"),
        bundledImage(named: "dart"), bundledImage(named: "disk rush") ]
    private var aryGameNames : [String] = ["Hyper Hockey", "Tic Tac Toe", "Marvel Bird", "Darts", "Disk Rush"]
    private var redirectionURLs : [String] = ["http://staging-server.in/HTML_Games_Tijara/hyper-hockey/",
         "http://staging-server.in/HTML_Games_Tijara/tic-tac-toe/",
         "http://staging-server.in/HTML_Games_Tijara/marvel-bird/",
         "http://staging-server.in/HTML_Games_Tijara/darts/",
         "http://staging-server.in/HTML_Games_Tijara/disk-rush/"]
    
    private var didSelectBlock:((String)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self
        
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.register(UINib(nibName: "GamingCollectionViewCell", bundle: Bundle(for: CapermintGamingSDK.classForCoder())), forCellWithReuseIdentifier: "Cell")
    }
    
    func setUpDidSelectBlock(withHandler handler: ((String)->Void)?) {
        if let handler = handler {
            self.didSelectBlock = handler
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.aryGameNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = self.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GamingCollectionViewCell {

            cell.imgView.image = self.aryImages[indexPath.row]
            cell.lblName.text = self.aryGameNames[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width/3, height: self.frame.size.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let handler = self.didSelectBlock {
            handler(self.redirectionURLs[indexPath.row])
        }
    }
}

func bundledImage(named: String) -> UIImage {
    let image = UIImage(named: named)
    if image == nil {
        return UIImage(named: named, in: Bundle(for: CapermintGamingSDK.classForCoder()), compatibleWith: nil)!
    }
    return image!
}
