

import UIKit

class HomeViewController: UIViewController,SDCycleScrollViewDelegate {
    
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
    let arr = ["http://www.lyj210.cn/cwgj/pic/huli/huli.jpg","http://www.lyj210.cn/cwgj/pic/siyang/siyang.jpg","http://www.lyj210.cn/cwgj/pic/xunlian/xunlian.jpg"]
    let ss = ["网络图片1","网络图片2","网路图片3"]
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sc = SDCycleScrollView(frame: CGRectMake(0, (self.navigationController?.navigationBar.frame.height)!+20, self.view.frame.width, 200), imageURLStringsGroup: nil)
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

    }
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        print("图片\(index)事件")
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
