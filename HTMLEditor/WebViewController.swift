//
//  WebViewController.swift
//  HTMLEditor
//
//  Created by VyacheslavKrivoi on 5/9/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var segue_in: String?
    @IBOutlet weak var fieldWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldWebView.loadHTMLString(segue_in! , baseURL: nil)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        fieldWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        fieldWebView.uiDelegate = self
        view = fieldWebView
    }
}
