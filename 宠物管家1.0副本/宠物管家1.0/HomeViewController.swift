

import UIKit

class HomeViewController: UIViewController, DJScrollViewDelegate {
    
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
    let arr = ["tab1","tab2","tab3","tab4"]
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let autoScrollerView = DJScrollView(frame: CGRectMake(0, (self.navigationController?.navigationBar.frame.height)!, self.view.frame.width, 200), animationDuration: 1)
        autoScrollerView.djDelegate = self
        self.view.addSubview(autoScrollerView)
        autoScrollerView.adsArray = arr
    }
    func didSelectScrollViewWithSelectNumber(selectNumber: Int32) {
        print("轮播图片点击页面\(selectNumber)")
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
