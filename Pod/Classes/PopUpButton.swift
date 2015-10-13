//
//  PopUpButton.swift
//  Pods
//
//  Created by Oberes, Karry Raia C. on 10/13/15.
//
//

import UIKit

@objc public protocol PopUpButtonDelegate {
    optional func handleButton1Pressed()
    optional func handleButton2Pressed()
    optional func handleButton3Pressed()
    optional func handleButton4Pressed()
    optional func handleButton5Pressed()
    optional func handleButton6Pressed()
    optional func handleButton7Pressed()
    optional func handleButton8Pressed()
    optional func handleButton9Pressed()
    optional func handleButton10Pressed()
    optional func handleButton11Pressed()
    optional func handleButton12Pressed()
    optional func handleButton13Pressed()
    optional func handleButton14Pressed()
    optional func handleButton15Pressed()
}

public class PopUpButton: UIButton, PopUpViewDelegate {
    
    private var dragPosition : CGPoint!
    private var viewPosition : CGPoint!
    private var viewFrame: CGRect!
    
    private var openView = true
    
    private var menuButton: UIButton!
    
    private var menuTitles = NSMutableArray()
    private var menuIconsNormal = NSMutableArray()
    private var menuIconsHighlighted = NSMutableArray()
    private var menuBG: String!
    private var menuHBG: String!
    
    private var title: UIColor!
    private var hTitle: UIColor!
    private var bColor: UIColor!
    private var bSColor: UIColor!
    private var bFont: UIFont!
    
    var delegate: PopUpButtonDelegate?
    
    
    
    // MARK: GET MENU PROPERTIES
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required public init(position: CGPoint, frame: CGRect, menuImage: UIImage, menuListTitle: NSArray, menuIconNormal: NSArray, menuIconHighlighted: NSArray, menuBackgroundImage: NSString, menuBackgroundHighlightedImage: NSString) {
        super.init(frame: frame)
        
        viewPosition = position
        viewFrame = frame
        
        menuBG = menuBackgroundImage as String
        menuHBG = menuBackgroundHighlightedImage as String
        
        // MENU TITLE AND ICON LIST
        menuTitles = menuListTitle.mutableCopy() as! NSMutableArray
        menuIconsNormal = menuIconNormal.mutableCopy() as! NSMutableArray
        menuIconsHighlighted = menuIconHighlighted.mutableCopy() as! NSMutableArray
        
        // MENU BUTTON
        menuButton = UIButton(frame: CGRectMake(0, 0, menuImage.size.width - 10, menuImage.size.height - 10))
        menuButton!.setImage(menuImage, forState: .Normal)
        menuButton!.userInteractionEnabled = true
        
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action:"tapMenu:"))
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragMenu:"))
        
        self.addSubview(menuButton)
    }
    
    
    // MARK: GESTURES
    
    // SHOW MENU
    func tapMenu(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.Began {
            showPopUp()
        }
    }
    
    // DRAG MENU
    
    func dragMenu(gesture: UIPanGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.Began {
            let locationInView = gesture.locationInView(superview)
            dragPosition = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
            return
        }
        
        if gesture.state == UIGestureRecognizerState.Ended {
            dragPosition = nil
            return
        }
        
        let locationInView = gesture.locationInView(superview)
        
        UIView.animateWithDuration(0.1) {
            self.center = CGPoint(x: locationInView.x - self.dragPosition!.x,
                y: locationInView.y - self.dragPosition!.y)
        }
    }
    
    
    // MARK: CUSTOM PROPERTIES
    
    public func getProperties(buttonTitleColor: UIColor, buttonTitleHighlightedColor: UIColor, buttonBackgroundColor: UIColor, buttonSeparatorColor: UIColor, buttonFont: UIFont) {
        
        title = buttonTitleColor
        hTitle = buttonTitleHighlightedColor
        bColor = buttonBackgroundColor
        bSColor = buttonSeparatorColor
        bFont = buttonFont
    }
    
    
    // MARK: SHOW POPUP
    
    public func showPopUp() {
        var popUp = PopUpViewController(menuButtonTitles: menuTitles, menuButtonNormalIcons: menuIconsNormal, menuButtonHighlightedIcons: menuIconsHighlighted, menuBGImage: menuBG, menuHBGImage: menuHBG)
        
        popUp.buttonTitleColor = title
        popUp.buttonSelectedTitleColor = hTitle
        popUp.buttonBackgroundColor = bColor
        popUp.separatorColor = bSColor
        popUp.buttonFont = bFont
        
        popUp.backgroundImage = menuBG
        popUp.backgroundHighlightedImage = menuHBG
        
        popUp.delegate = self
        popUp.show()
    }
    
    
    // MARK: MENU BUTTON DELEGATE FROM POPUP VIEW
    
    public func handleButton1Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton1Pressed!()
        }
    }
    
    public func handleButton2Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton2Pressed!()
        }
    }
    
    public func handleButton3Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton3Pressed!()
        }
    }
    
    public func handleButton4Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton4Pressed!()
        }
    }
    
    public func handleButton5Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton5Pressed!()
        }
    }
    
    public func handleButton6Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton6Pressed!()
        }
    }
    
    public func handleButton7Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton7Pressed!()
        }
    }
    
    public func handleButton8Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton8Pressed!()
        }
    }
    
    public func handleButton9Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton9Pressed!()
        }
    }
    
    public func handleButton10Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton10Pressed!()
        }
    }
    
    public func handleButton11Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton11Pressed!()
        }
    }
    
    public func handleButton12Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton12Pressed!()
        }
    }
    
    public func handleButton13Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton13Pressed!()
        }
    }
    
    public func handleButton14Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton14Pressed!()
        }
    }
    
    public func handleButton15Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton15Pressed!()
        }
    }
    
}





