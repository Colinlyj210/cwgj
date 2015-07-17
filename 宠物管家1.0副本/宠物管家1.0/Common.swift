//
//  Common.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/11.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

struct Common {
    static let screenWidth = UIScreen.mainScreen().bounds.maxX
    static let screenHeight = UIScreen.mainScreen().bounds.maxY
    static let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as! ViewController
    static let msgVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Msg") as UIViewController
    static let petsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Pets") as UIViewController
}
