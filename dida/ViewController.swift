//
//  ViewController.swift
//  dida
//
//  Created by billyct on 15/12/21.
//  Copyright © 2015年 billyct. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WebFrameLoadDelegate {

    @IBOutlet weak var webView: WebView!
    
    let webUrl = "https://dida365.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL(string: webUrl)
        let request = NSURLRequest(URL: url!)
        
        
        webView.frameLoadDelegate = self //delegate 你懂的
        webView.mainFrame.loadRequest(request)
        webView.drawsBackground = false //我不想要白色的背景
    }

    
    
    
    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        //更新css
        if(webView.mainFrameDocument != nil) {
            let domDocument: DOMDocument = webView.mainFrameDocument
            let styleElement: DOMElement? = domDocument.createElement("style")
            styleElement!.setAttribute("type", value: "text/css")
            let cssText: DOMText? = domDocument.createTextNode("body{background-color:transparent !important;}.g-left{background-color:RGBA(80, 114, 190, 0.9);}.g-left,.g-center,.g-right{padding-top:20px;}.g-right,.g-center,.task{background-color:RGBA(255, 255, 255, 0.9);}")
            styleElement!.appendChild(cssText)
            let headElement: DOMElement? = domDocument.getElementsByTagName("head").item(0) as? DOMElement
            headElement!.appendChild(styleElement)
        }
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }


}

