//
//  WebViewController.swift
//  Vimmy 2
//
//  Created by Richard Davis on 4/17/17.
//  Copyright (c) 2017 Richard Davis. All rights reserved.
//  Based on SampleWebView framework (https://github.com/spaceotech/SampleWebView)
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var viewContent: WKWebView!
    @IBOutlet weak var sectionTitle: UILabel!
    
    @objc var localFile = ""
    @objc var section = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set section title
        sectionTitle.text = section
        
        // Load local content
        let localFilePath = Bundle.main.url(forResource: localFile, withExtension: "html", subdirectory: "Content")
        let localRequest = URLRequest(url: localFilePath!)
        viewContent.load(localRequest as URLRequest)
    }
    
    //MARK: WebView Delegate Methods
    
    @objc func webViewDidStartLoad(_ webView: WKWebView) {
    }
    
    @objc func webViewDidFinishLoad(_ webView: WKWebView) {
    }
    
    @objc func webView(_ webView: WKWebView, didFailLoadWithError error: Error) {
    }
    
    @IBAction func actionBack(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
