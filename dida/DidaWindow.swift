//
//  DidaWindow.swift
//  dida
//
//  Created by billyct on 15/12/21.
//  Copyright © 2015年 billyct. All rights reserved.
//

import Cocoa

class DidaWindow: NSWindow {
    
    //参考http://stackoverflow.com/questions/7287696/moving-borderless-nswindow-fully-covered-with-web-view
    
    var initLocation: NSPoint = NSPoint(x: 0, y: 0)
    
    
    override func sendEvent(theEvent: NSEvent) {
        if(theEvent.type == NSEventType.KeyDown) {
            if(theEvent.keyCode == 36) {
                return;
            }
        }
        
        
        if(theEvent.type == NSEventType.LeftMouseDown) {
            self.mouseDown(theEvent)
        } else if (theEvent.type == NSEventType.LeftMouseDragged) {
            self.mouseDragged(theEvent)
        }
        
        super.sendEvent(theEvent)
    }
    
    
    
    override func mouseDown(theEvent: NSEvent) {
        initLocation = theEvent.locationInWindow
        
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        let screenVisibleFrame: NSRect = (NSScreen.mainScreen()?.visibleFrame)!
        let windowFrame: NSRect = self.frame
        var newOrigin = windowFrame.origin
        
        let currentLocation: NSPoint = theEvent.locationInWindow
        
        
        if(currentLocation.y > windowFrame.size.height - 40) {
            newOrigin.x += (currentLocation.x - initLocation.x);
            newOrigin.y += (currentLocation.y - initLocation.y);
            
            if ((newOrigin.y  + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)){
                newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
            }
            
            self.setFrameOrigin(newOrigin)
        }
        
    }
}
