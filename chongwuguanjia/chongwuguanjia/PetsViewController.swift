//
//  PetsViewController.swift
//  cehuatest
//
//  Created by lyj on 15/7/16.
//  Copyright © 2015年 lyj. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController,SDCycleScrollViewDelegate ,UITableViewDataSource,UITableViewDelegate{
    let arr = ["http://www.lyj210.cn/cwgj/pic/huli/huli.jpg","http://www.lyj210.cn/cwgj/pic/siyang/siyang.jpg","http://www.lyj210.cn/cwgj/pic/xunlian/xunlian.jpg"]
    let ss = ["网络图片1","网络图片2","网路图片3"]
    let adUrl = ["http://v.xiumi.us/board/v3/25PvV/2750964","http://v.xiumi.us/board/v3/25PvV/2760872","http://v.xiumi.us/board/v3/25PvV/2760848"]
    var url = "http://v.xiumi.us/board/v3/25PvV/2750964"
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let sc = SDCycleScrollView(frame: CGRectMake(0, (self.navigationController?.navigationBar.frame.height)!+20, self.view.frame.width, 415 * self.view.frame.width/650), imageURLStringsGroup: nil)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            sc.imageURLStringsGroup = self.arr
        }
        
        sc.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        sc.titlesGroup = ss
        sc.delegate = self
        sc.autoScrollTimeInterval = 2
        //cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        sc.placeholderImage = UIImage(named: "h1")//网络图片未加载时显示图片h1
        self.view.addSubview(sc)
        let height = (self.navigationController?.navigationBar.frame.height)! + sc.frame.height + sc.titleLabelHeight
        tableView = UITableView(frame: CGRectMake(0,height , self.view.frame.width, self.view.frame.height - height - (self.tabBarController?.tabBar.frame.height)!))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        self.url = adUrl[index]

        self.performSegueWithIdentifier("web", sender: self)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    tab
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "web"{
            if let a = segue.destinationViewController as? WebViewController{
                a.url = self.url
            }
        }
        self.tabBarController?.tabBar.hidden = true
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }

    
}
