

import UIKit

class HomeViewController: UIViewController {
    
    var titleOfOtherPages = ""

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showOtherPages" {
            if let a = segue.destinationViewController as? OtherPageViewController {
                a.PageTitle = titleOfOtherPages
           }
        }
    }
    

}
