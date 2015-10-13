# PopUpMenu

[![Version](https://img.shields.io/cocoapods/v/PopUpMenu.svg?style=flat)](http://cocoapods.org/pods/PopUpMenu)
[![License](https://img.shields.io/cocoapods/l/PopUpMenu.svg?style=flat)](http://cocoapods.org/pods/PopUpMenu)
[![Platform](https://img.shields.io/cocoapods/p/PopUpMenu.svg?style=flat)](http://cocoapods.org/pods/PopUpMenu)

## Usage
*For Objective C*
Go to Build Settings of your project and search for Packaging. Under it you would find **Defines Module**, then change it to **Yes**. Then build your project after.

###For Swift
```swift
import PopUpMenu

var menu = PopUpButton(position: CGPointMake(0,0), frame: CGRectMake(7, 30, 35, 35), menuImage: menuIcon!, menuListTitle: ["Menu1", "Menu2", "Menu3", "Menu4"], menuIconNormal: ["Menu1", "Menu2", "Menu3", "Menu4"], menuIconHighlighted: ["Menu1H", "Menu2H", "Menu3H", "Menu4H"],  menuBackgroundImage: "", menuBackgroundHighlightedImage: "")

menu.getProperties(UIColor.blackColor().colorWithAlphaComponent(0.7), buttonTitleHighlightedColor: UIColor.whiteColor(), buttonBackgroundColor: UIColor(red: 17/255.0, green: 193/255.0, blue: 210/255.0, alpha: 1.0), buttonSeparatorColor: UIColor.darkGrayColor(), buttonFont: UIFont(name: "HelveticaNeue-Light", size: 20)!)

self.view.addSubview(menu)
```

###For Objective C
```objc
@import PopUpMenu;
```
###Example Project
Run the Example Project to see the whole sample code on how to use the PopUpMenu pod in a project.


## Installation

PopUpMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PopUpMenu"
```

## License

PopUpMenu is available under the MIT license. See the LICENSE file for more info.
