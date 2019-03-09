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
        
        // create button to select site to load
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        
        
    }

    @objc func openTapped() {
        // create an alert controller in the form of an action sheet
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        // add actions to open websites
        ac.addAction(UIAlertAction(title: "nfl.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "patriots.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "chiefs.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "dallascowboys.com", style: .default, handler: openPage))
        // add action to cancel
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    // method that gets called when user selects the action sheet
    func openPage(action: UIAlertAction) {
        // set the URL equal to the button selected by the user
        let url = URL(string: "https://\(action.title!)")!
        // load the webpage
        webView.load(URLRequest(url: url))
    }
    
    // when the loading phase is completed
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // set the view controller title equal to the title of the webView
        title = webView.title
    }
    

}

