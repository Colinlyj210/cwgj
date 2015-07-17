

import UIKit

class HomeViewController: UIViewController, CNAutoScrollViewDelegate {
    
    var titleOfOtherPages = ""
    let arr = ["tab1","tab2","tab3","tab4"]
    var autoScrollView: CNAutoScrollView!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        autoScrollView = CNAutoScrollView(frame: CGRectMake(0, 20, self.view.frame.width, 200))
        autoScrollView.backgroundColor = UIColor.grayColor()
        autoScrollView.delegate = self
        view.addSubview(autoScrollView)
        autoScrollView.addTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numbersOfPages() -> Int {
        return arr.count
    }
    
    func imageNameOfIndex(index: Int) -> String! {
        return arr[index]
    }
    
    func didSelectedIndex(index: Int) {
        print("you click autoScrollView index:\(index)")
        //这里写以后要执行的方法
    }
    
    func currentIndexDidChange(index: Int) {
        print("autoScrollView currentIndex didChange :\(index)")
    }
    
    func indexDidChange(index: Int) {
        print("scrollView currentIndexDidChange :\(index)")
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
