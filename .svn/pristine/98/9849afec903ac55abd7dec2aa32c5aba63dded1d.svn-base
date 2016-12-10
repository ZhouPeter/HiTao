//
//  GuideViewController.swift
//  YYT-V3-SalaryEdition
//
//  Created by archer.wang on 15/8/12.
//  Copyright (c) 2015年 Chinajey. All rights reserved.
//

import UIKit


class GuideViewController: UIViewController ,UIScrollViewDelegate{
    
    let kNumberOfScreen = 2
    
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    var startBtn:UIButton!
    var image :UIImage!
    var imageStartButton :UIImage!
    var startContentOffsetX = CGFloat()
    var willEndContentOffsetX = CGFloat()
    var endContentOffsetX = CGFloat()
    var imagePath:[String]?
    var imageVersion:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGTH))
        self.scrollView.isScrollEnabled = false
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator=false
        self.scrollView.showsVerticalScrollIndicator=false
        self.scrollView.contentSize=CGSize(width: CGFloat(kNumberOfScreen) * SCREEN_WIDTH,  height: SCREEN_HEIGTH)
        self.getOldImage()
        CountDown.startTime(time: 5){ timeout in
            if timeout == 3{
                UIView.animate(withDuration: 1, animations: {
                    self.scrollView.contentOffset = CGPoint(x: SCREEN_WIDTH, y: 0)
                    
                })
            }else if timeout == 0{
                UserDefaults.standard.set("1", forKey: "guide")
                UserDefaults.standard.synchronize()
                (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController =  MainTabBarViewController()
            }
            
        }
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.startContentOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.willEndContentOffsetX = scrollView.contentOffset.x
        if (self.willEndContentOffsetX != 0 && self.startContentOffsetX == CGFloat((kNumberOfScreen - 1) * Int(SCREEN_WIDTH))) && startContentOffsetX == self.willEndContentOffsetX {
            UserDefaults.standard.set("1", forKey: "guide")
            UserDefaults.standard.synchronize()
            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController =  MainTabBarViewController()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.frame
        self.pageControl.currentPage = Int(offset.x / bounds.size.width)
    }
    
    func getOldImage(){
        for i in 1...kNumberOfScreen {
            if(SCREEN_WIDTH == 640){
                image = UIImage(named: "引导页640(\(i))")
            } else if(SCREEN_WIDTH == 750){
                image = UIImage(named: "引导页750(\(i))")
            } else {
                image = UIImage(named: "引导页1242(\(i))")
            }
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: CGFloat((i-1))*SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGTH)
            imageView.contentMode = UIViewContentMode.scaleToFill
            self.scrollView.addSubview(imageView)
            
        }
        self.scrollView.bounces=false
        self.scrollView.delegate=self
        self.view.addSubview(self.scrollView)

        //self.pageControl=UIPageControl(frame: CGRect(x: SCREEN_WIDTH/2-100, y: 0, width: 200, height: 40))
        //self.pageControl.numberOfPages = 2
        //self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        //self.pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        //self.pageControl.currentPage = 0
        //self.view.addSubview(self.pageControl)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var shouldAutorotate : Bool{
        return false
    }
    
}
