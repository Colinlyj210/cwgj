

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func more(sender: UIBarButtonItem) {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y += 30
        
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem("kefu",image: nil ,target:self,action:"moreClicked")
            ])
    }
    func moreClicked(){
        print("11111")
    }
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
