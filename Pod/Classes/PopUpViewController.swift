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
    
    
    // MARK: INITIALIZE BUTTON PROPERTIES
    
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
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.frame = UIScreen.mainScreen().bounds
        UIApplication.sharedApplication().keyWindow?.addSubview(self.view)
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        self.view.alpha = 0.0
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:"hide"))
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.createMenuView()
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        PrivateInstance.currentInstance = self
    }
    
    
    // CREATE VIEW
    
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
    
    // SHOW VIEW WHEN MENU BUTTON IS SELECTED
    
    func show() {
        self.view.alpha = 1.0
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.menuView.alpha = 1.0
        })
    }
    
    
    // HIDE VIEW WHEN SUB MENU BUTTON IS SELECTED
    
    func hide() {
        if returnToNormalWhenSelected {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.alpha = 0.0
                PrivateInstance.currentInstance = nil
            })
        }
    }
    
    
    // MARK: SUB MENU BUTTON DELEGATE
    
    public func handleButton1Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton1Pressed!()
        }
    }
    
    public func handleButton2Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton2Pressed!()
        }
    }
    
    public func handleButton3Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton3Pressed!()
        }
    }
    
    public func handleButton4Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton4Pressed!()
        }
    }
    
    public func handleButton5Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton5Pressed!()
        }
    }
    
    public func handleButton6Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton6Pressed!()
        }
    }
    
    public func handleButton7Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton7Pressed!()
        }
    }
    
    public func handleButton8Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton8Pressed!()
        }
    }
    
    public func handleButton9Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton9Pressed!()
        }
    }
    
    public func handleButton10Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton10Pressed!()
        }
    }
    
    public func handleButton11Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton11Pressed!()
        }
    }
    
    public func handleButton12Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton12Pressed!()
        }
    }
    
    public func handleButton13Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton13Pressed!()
        }
    }
    
    public func handleButton14Pressed() {
        if self.delegate != nil {
            hide()
            self.delegate!.handleButton14Pressed!()
        }
    }
    
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
