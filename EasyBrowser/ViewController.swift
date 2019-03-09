//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Fabio on 09/03/2019.
//  Copyright © 2019 JohnMutina. All rights reserved.
//

import UIKit
// import WebKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    //create a variable to store our web view
    var webView: WKWebView!
    
    override func loadView() {
        // assign a new instance of WKWebView to our variable
        webView = WKWebView()
        // design current view controller as delegate
        webView.navigationDelegate = self
        // we assign the new webView to our view
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize a url variable
        let url = URL(string: "https://www.nfl.com")!
        // loads the url
        webView.load(URLRequest(url: url))
        // activates navigation gestures
        webView.allowsBackForwardNavigationGestures = true
        
    }


}

