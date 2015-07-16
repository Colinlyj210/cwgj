

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titlesDictionary = ["我的信息","我的宠物"]

    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var heightLayoutConstraintOfSettingTableView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.tableFooterView = UIView()
        
        heightLayoutConstraintOfSettingTableView.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347
        self.view.frame = CGRectMake(0, 0, 320 * 0.78, Common.screenHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = Common.rootViewController
        viewController.homeViewController.titleOfOtherPages = titlesDictionary[indexPath.row]
        viewController.homeViewController.performSegueWithIdentifier("showOtherPages", sender: self)
        Common.petsVC.view.removeFromSuperview()
        viewController.mainTabBarController.tabBar.hidden = true
        viewController.mainTabBarController.selectedIndex = 0
        viewController.showHome()
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftViewCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = titlesDictionary[indexPath.row]
        
        return cell
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
