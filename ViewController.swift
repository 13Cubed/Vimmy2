//
//  ViewController.swift
//  Vimmy 2
//
//  Created by Richard Davis on 4/17/17.
//  Copyright (c) 2017 Richard Davis. All rights reserved.
//  Based on SampleWebView framework (https://github.com/spaceotech/SampleWebView)
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainMenu.reloadData()
    }
    
    //MARK: UITableViewDataSource
    
    @objc func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    @objc func configureCell(_ cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        switch forRowAtIndexPath.row {
        case 0:
            cell.textLabel?.text = "Moving Around"
            let cellIcon : UIImage = UIImage(named: "MovingAround")!
            cell.imageView?.image = cellIcon
        case 1:
            cell.textLabel?.text = "Editing"
            let cellIcon : UIImage = UIImage(named: "Editing")!
            cell.imageView?.image = cellIcon
        case 2:
            cell.textLabel?.text = "Cut, Copy, and Paste"
            let cellIcon : UIImage = UIImage(named: "CutCopyandPaste")!
            cell.imageView?.image = cellIcon
        case 3:
            cell.textLabel?.text = "Search and Replace"
            let cellIcon : UIImage = UIImage(named: "SearchandReplace")!
            cell.imageView?.image = cellIcon
        case 4:
            cell.textLabel?.text = "Regular Expressions"
            let cellIcon : UIImage = UIImage(named: "RegularExpressions")!
            cell.imageView?.image = cellIcon
        case 5:
            cell.textLabel?.text = "Tabs and Windows"
            let cellIcon : UIImage = UIImage(named: "TabsandWindows")!
            cell.imageView?.image = cellIcon
        case 6:
            cell.textLabel?.text = "Miscellaneous"
            let cellIcon : UIImage = UIImage(named: "Miscellaneous")!
            cell.imageView?.image = cellIcon
        default:
            break
        }
        
        cell.accessoryType = .disclosureIndicator
    }
    
    //MARK: UITableViewDelegate
    
    @objc func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let webViewObj = self.storyboard?.instantiateViewController(withIdentifier: "WebViewControllerID") as! WebViewController
        
        switch indexPath.row {
        case 0:
            webViewObj.localFile = "MovingAround"
            webViewObj.section = "Moving Around"
        case 1:
            webViewObj.localFile = "Editing"
            webViewObj.section = "Editing"
        case 2:
            webViewObj.localFile = "CutCopyandPaste"
            webViewObj.section = "Cut, Copy, and Paste"
        case 3:
            webViewObj.localFile = "SearchandReplace"
            webViewObj.section = "Search and Replace"
        case 4:
            webViewObj.localFile = "RegularExpressions"
            webViewObj.section = "Regular Expressions"
        case 5:
            webViewObj.localFile = "TabsandWindows"
            webViewObj.section = "Tabs and Windows"
        case 6:
            webViewObj.localFile = "Miscellaneous"
            webViewObj.section = "Miscellaneous"
        default:
            break
        }
        
        self.navigationController?.pushViewController(webViewObj, animated: true)
    }
    
    @objc func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    @IBAction func about() {
        let webViewObj = self.storyboard?.instantiateViewController(withIdentifier: "WebViewControllerID") as! WebViewController
        
        webViewObj.localFile = "About"
        webViewObj.section = "About"
        
        self.navigationController?.pushViewController(webViewObj, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
