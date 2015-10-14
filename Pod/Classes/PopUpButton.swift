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
    
    public var delegate: PopUpButtonDelegate?
    
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: GET BUTTON AND VIEW PROPERTIES
    /**
    Initializes a button with the provided specifications.
    
    - Parameters:
    - frame: The frame size for the button
    - menuImage: The image for the button
    - menuListTitle: The list of the titles to be passed in the PopUp View Controller (PopUp Menu), in an Array of String
    - menuIconNormal: The list of the image names to be passed in  the PopUp View Controller (PopUp Menu) for Normal State
    - menuIconHighlighted: The list of the image names to be passed in  the PopUp View Controller (PopUp Menu) for Highlighted State
    - menuBackgroundImage: The background image for the menus to be passed in the PopUp View Controller (PopUp Menu) for Normal State
    - menuBackgroundHighlightedImage: The background image for the menus to be passed in the PopUp View Controller (PopUp Menu) for Highlighted State
    
    - Returns: A floating custom button that is once long pressed shows a PopUp Menu.
    */
    required public init(frame: CGRect, menuImage: UIImage, menuListTitle: NSArray, menuIconNormal: NSArray, menuIconHighlighted: NSArray, menuBackgroundImage: NSString, menuBackgroundHighlightedImage: NSString) {
        super.init(frame: frame)
        
        menuBG = menuBackgroundImage as String
        menuHBG = menuBackgroundHighlightedImage as String
        
        // MENU TITLE AND ICON LIST
        menuTitles = menuListTitle.mutableCopy() as! NSMutableArray
        menuIconsNormal = menuIconNormal.mutableCopy() as! NSMutableArray
        menuIconsHighlighted = menuIconHighlighted.mutableCopy() as! NSMutableArray
        
        // MENU BUTTON
        menuButton = UIButton(frame: CGRectMake(0, 0, menuImage.size.width, menuImage.size.height))
        menuButton!.setImage(menuImage, forState: .Normal)
        menuButton!.userInteractionEnabled = true
        
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action:"tapMenu:"))
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "dragMenu:"))
        
        self.addSubview(menuButton)
    }
    
    
    // MARK: GESTURES
    
    // MARK: CALL POPUP
    ///Calls the showPopUp function once a long press gesture is detected from the button.
    func tapMenu(gesture: UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizerState.Began {
            showPopUp()
        }
    }
    
    // MARK: DRAG MENU BUTTON
    ///Is called once the user clicks the button then drags the button anywhere inside the view
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
    /**
    Used to get the properties for the menus inside the PopUp View Controller (PopUp Menu) from the user.
    
    - Parameters:
    - buttonTitleColor: The color for the title label of the menu for Normal State
    - buttonTitleHighlightedColor: The color for the title label of the menu for Highlighted State
    - buttonBackgroundColor: The background color for the menu
    - buttonSeparatorColor: The color for the separator color of the menus
    - buttonFont: The font for the title label of the menu
    */
    public func getProperties(buttonTitleColor: UIColor, buttonTitleHighlightedColor: UIColor, buttonBackgroundColor: UIColor, buttonSeparatorColor: UIColor, buttonFont: UIFont) {
        
        title = buttonTitleColor
        hTitle = buttonTitleHighlightedColor
        bColor = buttonBackgroundColor
        bSColor = buttonSeparatorColor
        bFont = buttonFont
    }
    
    
    // MARK: SHOW POPUP
    /**
    Is being called when the button is long pressed
    Shows the PopUp View Controller (PopUp Menu)
    */
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
    
    ///Call the handleButton1Pressed delegate when the 1st menu button is pressed.
    public func handleButton1Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton1Pressed!()
        }
    }
    
    ///Call the handleButton2Pressed delegate when the 2nd menu button is pressed.
    public func handleButton2Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton2Pressed!()
        }
    }
    
    ///Call the handleButton3Pressed delegate when the 3rd menu button is pressed.
    public func handleButton3Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton3Pressed!()
        }
    }
    
    ///Call the handleButton4Pressed delegate when the 4th menu button is pressed.
    public func handleButton4Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton4Pressed!()
        }
    }
    
    ///Call the handleButton5Pressed delegate when the 5th menu button is pressed.
    public func handleButton5Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton5Pressed!()
        }
    }
    
    ///Call the handleButton6Pressed delegate when the 6th menu button is pressed.
    public func handleButton6Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton6Pressed!()
        }
    }
    
    ///Call the handleButton7Pressed delegate when the 7th menu button is pressed.
    public func handleButton7Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton7Pressed!()
        }
    }
    
    ///Call the handleButton8Pressed delegate when the 8th menu button is pressed.
    public func handleButton8Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton8Pressed!()
        }
    }
    
    ///Call the handleButton9Pressed delegate when the 9th menu button is pressed.
    public func handleButton9Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton9Pressed!()
        }
    }
    
    ///Call the handleButton10Pressed delegate when the 10th menu button is pressed.
    public func handleButton10Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton10Pressed!()
        }
    }
    
    ///Call the handleButton11Pressed delegate when the 11th menu button is pressed.
    public func handleButton11Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton11Pressed!()
        }
    }
    
    ///Call the handleButton12Pressed delegate when the 12th menu button is pressed.
    public func handleButton12Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton12Pressed!()
        }
    }
    
    ///Call the handleButton13Pressed delegate when the 13th menu button is pressed.
    public func handleButton13Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton13Pressed!()
        }
    }
    
    ///Call the handleButton14Pressed delegate when the 14th menu button is pressed.
    public func handleButton14Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton14Pressed!()
        }
    }
    
    ///Call the handleButton15Pressed delegate when the 15th menu button is pressed.
    public func handleButton15Pressed() {
        if self.delegate != nil {
            self.delegate!.handleButton15Pressed!()
        }
    }
    
}





