//
//  DidaWindowController.swift
//  dida
//
//  Created by billyct on 15/12/21.
//  Copyright © 2015年 billyct. All rights reserved.
//

import Cocoa

class DidaWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        
        //背景为空白的，透明的
        window?.backgroundColor = NSColor.clearColor()
        window?.opaque = false
        
        

        var frame : NSRect = (window?.frame)!
        let size : CGSize = CGSize(width: 1200, height: 700)

        frame.size = size
        window?.setFrame(frame, display: true, animate: true)
        
        window?.center()
        
        //取消titlebar，然后还有3个按钮
        window?.titleVisibility = NSWindowTitleVisibility.Hidden;
        window?.titlebarAppearsTransparent = true
        window?.styleMask |= NSFullSizeContentViewWindowMask;
        
        
        //获取事件什么的
        window?.becomeKeyWindow()
        window?.becomeFirstResponder()
    }

}
