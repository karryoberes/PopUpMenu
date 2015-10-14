//
//  PopUpViewController.swift
//  Pods
//
//  Created by Oberes, Karry Raia C. on 10/13/15.
//
//

import UIKit

@objc protocol PopUpViewDelegate {
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

/// Sets the current instance to its self
private struct PrivateInstance {
    static var currentInstance: PopUpViewController!
}


public class PopUpViewController: UIViewController {
    
    var menuView: UIView!
    var menuButton: UIButton!
    
    var delegate: PopUpViewDelegate?
    
    var buttonTitles = NSMutableArray()
    var buttonNormalIcons = NSMutableArray()
    var buttonHighlightedIcons = NSMutableArray()
    
    var btnHeight:CGFloat = 40
    
    public var buttonTitleColor: UIColor!
    public var buttonSelectedTitleColor: UIColor!
    public var buttonBackgroundColor: UIColor!
    public var separatorColor: UIColor!
    public var buttonFont: UIFont!
    
    public var backgroundImage: String!
    public var backgroundHighlightedImage: String!
    
    var returnToNormalWhenSelected = true
    
    
    // MARK: INITIALIZE POPUP MENU PROPERTIES
    /**
    Initializes a view controller with the provided specifications from the PopUp Button.
    
    - Parameters:
    - menuButtonTitles: The list of the titles for the PopUp View Controller (PopUp Menu), in an Array of String
    - menuButtonNormalIcons: The list of the image names for the PopUp View Controller (PopUp Menu) for Normal State
    - menuButtonHighlightedIcons: The list of the image names for the PopUp View Controller (PopUp Menu) for Highlighted State
    - menuBGImage: The background image for the menus inside the PopUp View Controller (PopUp Menu) for Normal State
    - menuHBGImage: The background image for the menus inside the PopUp View Controller (PopUp Menu) for Highlighted State
    
    - Returns: A custom PopUp Menu.
    */
    convenience init(menuButtonTitles: NSArray!, menuButtonNormalIcons: NSArray!, menuButtonHighlightedIcons: NSArray!, menuBGImage: String!, menuHBGImage: String!) {
        self.init()
        
        if let titles = menuButtonTitles {
            buttonTitles.addObjectsFromArray(titles as [AnyObject])
        }
        
        if let iconsN = menuButtonNormalIcons {
            buttonNormalIcons.addObjectsFromArray(iconsN as [AnyObject])
        }
        
        if let iconsH = menuButtonHighlightedIcons {
            buttonHighlightedIcons.addObjectsFromArray(iconsH as [AnyObject])
        }
        
        backgroundImage = menuBGImage
        backgroundHighlightedImage = menuHBGImage
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /**
    Initializes the view's frame and properties of the PopUp Menu.
    Adds a gesture recognizer that once the user taps oustide the view, it will dismiss the presented view.
    */
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.frame = UIScreen.mainScreen().bounds
        UIApplication.sharedApplication().keyWindow?.addSubview(self.view)
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        self.view.alpha = 0.0
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:"hide"))
    }
    
    /// Once the view will appear it calls the createMenuView.
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.createMenuView()
    }
    
    /// Once the view appeared it sets the current instance to its self.
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        PrivateInstance.currentInstance = self
    }
    
    
    // MARK: CREATE VIEW FOR POPUP MENU
    /**
    This function is set to create the view for the PopUp Menu.
    Sets the button's frame and its properties and adds it into the view.
    Initializes the view's frame and its properties.
    */
    func createMenuView() {
        
        menuView = UIView()
        
        var btnArray = NSMutableArray()
        
        for (index, title) in enumerate(buttonTitles) {
            menuButton = UIButton(frame: CGRectMake(0, 0, 0, btnHeight))
            menuButton.tag = index+1
            menuButton.backgroundColor = buttonBackgroundColor
            
            if (!backgroundImage.isEmpty && !backgroundHighlightedImage.isEmpty) {
                menuButton.setBackgroundImage(UIImage(named: backgroundImage), forState: .Normal)
                menuButton.setBackgroundImage(UIImage(named: backgroundHighlightedImage), forState: .Highlighted)
            }
            
            if (buttonNormalIcons.count >= 1 && buttonHighlightedIcons.count >= 1) {
                menuButton.setImage(UIImage(named: buttonNormalIcons[index] as! String), forState: .Normal)
                menuButton.setImage(UIImage(named: buttonHighlightedIcons[index] as! String), forState: .Highlighted)
                menuButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
            }
            
            menuButton.setTitle(title as! NSString as String, forState: .Normal)
            menuButton.titleLabel?.font = buttonFont
            menuButton.setTitleColor(buttonTitleColor, forState: UIControlState.Normal)
            menuButton.setTitleColor(buttonSelectedTitleColor, forState: .Highlighted)
            
            let selector = "handleButton\(index+1)Pressed"
            menuButton.addTarget(self, action: Selector(selector), forControlEvents: .TouchUpInside)
            
            btnArray.addObject(menuButton)
        }
        
        menuView.frame = CGRectMake(20, 0, self.view.frame.width - 90, btnHeight * CGFloat(btnArray.count))
        menuView.center = self.view.center
        
        
        var bYOrigin :CGFloat = 0.0
        
        for (index,button) in enumerate(btnArray) {
            if var btn = button as? UIButton {
                btn.frame = CGRectMake(0, bYOrigin, menuView.frame.size.width, btnHeight)
                bYOrigin += btnHeight
                
                btn.titleLabel?.adjustsFontSizeToFitWidth = true
                
                btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100)
                btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
                
                menuView.addSubview(btn)
            }
        }
        
        var sYOrigin :CGFloat = btnHeight + 0.5
        
        for button in btnArray {
            var separatorView = UIView(frame: CGRectMake(0, sYOrigin, menuView.frame.width, 0.7))
            sYOrigin += btnHeight + 0.5
            
            separatorView.backgroundColor = separatorColor
            menuView.addSubview(separatorView)
        }
        
        menuView.layer.cornerRadius = 7.0
        menuView.clipsToBounds = true
        menuView.backgroundColor = UIColor.clearColor()
        menuView.alpha = 0.0
        
        self.view.addSubview(menuView)
    }
    
    // MARK: SHOW VIEW WHEN MENU BUTTON IS SELECTED
    /// This function is used and called to present the view with animation and dim view background.
    func show() {
        self.view.alpha = 1.0
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.menuView.alpha = 1.0
        })
    }
    
    
    // MARK: HIDE VIEW WHEN SUB MENU BUTTON IS SELECTED
    /// This function is used and called to dismiss the view with animation and return to its normal view background.
    func hide() {
        if returnToNormalWhenSelected {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.alpha = 0.0
                PrivateInstance.currentInstance = nil
            })
        }
    }
    
    
    // MARK: SUB MENU BUTTON DELEGATE
    
    ///Hides the view and call the handleButton1Pressed delegate when the 1st menu button is pressed.
    public func handleButton1Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton1Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton2Pressed delegate when the 2nd menu button is pressed.
    public func handleButton2Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton2Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton3Pressed delegate when the 3rd menu button is pressed.
    public func handleButton3Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton3Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton4Pressed delegate when the 4th menu button is pressed.
    public func handleButton4Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton4Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton5Pressed delegate when the 5th menu button is pressed.
    public func handleButton5Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton5Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton6Pressed delegate when the 6th menu button is pressed.
    public func handleButton6Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton6Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton7Pressed delegate when the 7th menu button is pressed.
    public func handleButton7Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton7Pressed!()
        }
    }
    
    ///Call the handleButton8Pressed delegate when the 8th menu button is pressed.
    public func handleButton8Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton8Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton9Pressed delegate when the 9th menu button is pressed.
    public func handleButton9Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton9Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton10Pressed delegate when the 10th menu button is pressed.
    public func handleButton10Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton10Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton11Pressed delegate when the 11th menu button is pressed.
    public func handleButton11Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton11Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton12Pressed delegate when the 12th menu button is pressed.
    public func handleButton12Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton12Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton13Pressed delegate when the 13th menu button is pressed.
    public func handleButton13Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton13Pressed!()
        }
    }
    
    ///Hides the view and call the handleButton14Pressed delegate when the 14th menu button is pressed.
    public func handleButton14Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton14Pressed!()
        }
    }
    
    ///Hides the view and calls the handleButton15Pressed delegate when the 15th menu button is pressed.
    public func handleButton15Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton15Pressed!()
        }
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
