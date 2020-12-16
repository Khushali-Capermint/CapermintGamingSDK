//
//  GamingCollectionView.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 16/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit

public class GamingCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var aryImages : [UIImage] = [#imageLiteral(resourceName: "disk rush empire"), #imageLiteral(resourceName: "Fruit Boom"), #imageLiteral(resourceName: "Hyper Hockey Empire"), #imageLiteral(resourceName: "New Tic Tac Toe"), #imageLiteral(resourceName: "Slide Empire")]
    private var aryGameNames : [String] = ["Disk Rush Empire", "Fruit Boom", "Hyper Hockey Empire", "New Tic Tac Toe", "Slide Empire"]
    private var redirectionURLs : [String] = ["http://15.206.236.166/staging/games/disk_rush_empire/","http://15.206.236.166/staging/games/fruit_boom_empire/","http://15.206.236.166/staging/games/hyper_hockey_empire","http://15.206.236.166/staging/games/tic_tac_toe_empire/","http://15.206.236.166/staging/games/slide_empire/"]
    
    private var didSelectBlock:((String)->Void)?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self
        
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func setUpDidSelectBlock(withHandler handler: ((String)->Void)?) {
        if let handler = handler {
            self.didSelectBlock = handler
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.aryGameNames.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = self.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GamingCollectionViewCell {
            
            cell.imgView.image = self.aryImages[indexPath.row]
            cell.lblName.text = self.aryGameNames[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width/3, height: self.frame.size.width/3)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let handler = self.didSelectBlock {
            handler(self.redirectionURLs[indexPath.row])
        }
    }
}
