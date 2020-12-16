//
//  ViewController.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 16/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit

public class CapermintGamingSDK: UIViewController {

    @IBOutlet weak var collectionGaming : GamingCollectionView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpCollectionViewBlocks()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
    }

    private func setUpCollectionViewBlocks() {
        self.collectionGaming.setUpDidSelectBlock { [weak self] (url) in
            guard let self = `self` else {return}
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewViewController") as? WebViewViewController {
                vc.url = url
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}

