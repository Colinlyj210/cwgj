//
//  WebViewController.swift
//  chongwuguanjia
//
//  Created by lyj on 15/7/26.
//  Copyright © 2015年 lyj. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var url = ""
    @IBOutlet var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weburl = NSURL(string: url)
        let request = NSURLRequest(URL: weburl!)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.web.loadRequest(request)
            self.tabBarController?.tabBar.hidden = true

        }
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
