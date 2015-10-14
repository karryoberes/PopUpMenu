//
//  ViewController.swift
//  PopUpMenu
//
//  Created by Oberes, Karry Raia C. on 10/13/2015.
//  Copyright (c) 2015 Oberes, Karry Raia C.. All rights reserved.
//

import UIKit
import PopUpMenu

class ViewController: UIViewController, PopUpButtonDelegate {

    let menuIcon = UIImage(named: "menuIcon")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Optional: Set the background color for the view
        self.view.backgroundColor = UIColor(red:0.2, green:0.38, blue:0.8, alpha:1)
        
        /* Image Properties:
           PopUpButton Width = Image Width
           PopUpButton Height = Image Height 
           
           Suggested Menu Icons Size = 25 x 25 upto 35 x 35
        */
        var menu = PopUpButton(frame: CGRectMake(7, 30, 35, 35), menuImage: menuIcon!, menuListTitle: ["Menu1", "Menu2", "Menu3", "Menu4"], menuIconNormal: ["Menu1", "Menu2", "Menu3", "Menu4"], menuIconHighlighted: ["Menu1H", "Menu2H", "Menu3H", "Menu4H"],  menuBackgroundImage: "", menuBackgroundHighlightedImage: "")
        
        // Get the properties for the menus in the PopUp View Controller (PopUp Menu)
        menu.getProperties(UIColor.blackColor().colorWithAlphaComponent(0.7), buttonTitleHighlightedColor: UIColor.whiteColor(), buttonBackgroundColor: UIColor(red: 17/255.0, green: 193/255.0, blue: 210/255.0, alpha: 1.0), buttonSeparatorColor: UIColor.darkGrayColor(), buttonFont: UIFont(name: "HelveticaNeue-Light", size: 20)!)
        
        menu.delegate = self

        self.view.addSubview(menu)

    }

    // Button1 Delegate
    func handleButton1Pressed(){
        print("Button1 Pressed")
    }
    
    // Button2 Delegate
    func handleButton2Pressed(){
        print("Button2 Pressed")
    }
    
    // Button3 Delegate
    func handleButton3Pressed(){
        print("Button3 Pressed")
    }
    
    // Button4 Delegate
    func handleButton4Pressed(){
        print("Button4 Pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

