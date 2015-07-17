//
//  MsgViewController.swift
//  cehuatest
//
//  Created by lyj on 15/7/16.
//  Copyright © 2015年 lyj. All rights reserved.
//

import UIKit

class MsgViewController: UIViewController {
    let items = [
        MenuItem(title: "face", iconName: "post_type_bubble_facebook", glowColor: UIColor.redColor(),index: 0),
        MenuItem(title: "tsobao", iconName: "post_type_bubble_flickr", glowColor: UIColor.blueColor(),index: 1),
    MenuItem(title: "sina", iconName: "post_type_bubble_googleplus", glowColor: UIColor.yellowColor(),index: 2)
    ]
    @IBAction func addClick(sender: UIBarButtonItem) {
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.isShowed
        if menu.isShowed{
            menu.removeFromSuperview()
            return
        }
        menu.menuAnimationType = PopMenuAnimationType.Sina
        menu.didSelectedItemCompletion = { (selectitem :MenuItem!) -> Void in
            print(selectitem.title)
            switch selectitem.index{
            case 0:
                print(selectitem.index)
            case 1:
                print(selectitem.index)
            case 2:
                print(selectitem.index)
            default:
                break
            }
        }
        menu.showMenuAtView(self.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
