//
//  WebViewController1.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 17/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit

import UIKit
import WebKit

public class WebViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnBack: UIBarButtonItem!

    var url: String = ""
    
    open var navigationBarColor : UIColor = UIColor.white
    open var navigationBarBackButtonColor : UIColor = UIColor.black

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.topItem?.title = ""
        
        self.navigationBar.barTintColor = navigationBarColor
        self.btnBack.tintColor = navigationBarBackButtonColor
        
        self.setUpData()
    }
    
    private func setUpData() {
        if let url = URL(string: url) {
            self.webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func btnBackClick(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

}
