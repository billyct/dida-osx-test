//
//  DragableView.swift
//  dida
//
//  Created by billyct on 15/12/21.
//  Copyright © 2015年 billyct. All rights reserved.
//

import Cocoa

class DragableView: NSView {
    
    
    override func mouseDown(theEvent: NSEvent) {
        NSCursor.arrowCursor().push()
    }
    
    
    override func mouseUp(theEvent: NSEvent) {
        NSCursor.closedHandCursor().pop()
        
        self.window?.invalidateCursorRectsForView(self)
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
}
