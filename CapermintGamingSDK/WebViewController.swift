//
//  WebViewController.swift
//  CapermintGamingSDK
//
//  Created by Khushali Nimje on 16/12/20.
//  Copyright © 2020 Khushali Nimje. All rights reserved.
//

import UIKit
import WebKit

open class WebViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var webView: WKWebView!

    var url: String = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.topItem?.title = ""
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
