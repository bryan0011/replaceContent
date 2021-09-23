//
//  ViewController.swift
//  replaceContent
//
//  Created by Bryan Kuo on 2021/7/19.
//

import UIKit

let dogImages = ["和服.jpg", "鬼娃娃.jpg", "睡覺.jpg",]
let dogLabels = ["和服", "鬼娃娃", "睡覺",]
let pageNumberLabels = ["1/3", "2/3", "3/3"]

var selectIndex = 0


class ViewController: UIViewController {
    @IBOutlet weak var cocoImage: UIImageView!
    @IBOutlet weak var pageDot: UIPageControl!
    @IBOutlet weak var statesLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pageLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statesLabel.text = dogLabels [0]
        pageLabel.text = pageNumberLabels [0]
    }

    func sync() {
        cocoImage.image = UIImage(named: dogImages[selectIndex])
        statesLabel.text = dogLabels[selectIndex]
        pageLabel.text = pageNumberLabels[selectIndex]
        pageDot.currentPage = selectIndex
        segment.selectedSegmentIndex = selectIndex
    }
    
    @IBAction func changePageDot(_ sender: UIPageControl) {
        selectIndex = sender.currentPage
        if pageDot.currentPage == 0 {
            selectIndex == 0
            sync()
        } else if pageDot.currentPage == 1 {
            selectIndex == 1
            sync()
        } else {
            selectIndex == 2
            sync()
        }
    }
    
    @IBAction func changeSegmentControl(_ sender: UISegmentedControl) {
        selectIndex = sender.selectedSegmentIndex
        if segment.selectedSegmentIndex == 0 {
            selectIndex == 0
            sync()
        } else if segment.selectedSegmentIndex == 1 {
            selectIndex == 1
            sync()
        } else {
            selectIndex == 2
            sync()
        }
    }
    
//    上一頁
    @IBAction func prevButton(_ sender: UIButton) {
        selectIndex -= 1
        if selectIndex == 2 {
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 0 {
            sync()
        } else {
            selectIndex = 2
            sync()
        }
    }
    
//    下一頁
    @IBAction func nextButton(_ sender: UIButton) {
        selectIndex += 1
        if selectIndex == 0 {
            sync()
        } else if selectIndex == 1 {
            sync()
        } else if selectIndex == 2 {
            sync()
        } else {
            selectIndex = 0
            sync()
        }
    }
    @IBAction func swipeImage(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            selectIndex += 1
            if selectIndex == 0 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 2 {
                sync()
            } else {
                selectIndex = 0
                sync()
            }
        } else if sender.direction == .right{
            selectIndex -= 1
            if selectIndex == 2 {
                sync()
            } else if selectIndex == 1 {
                sync()
            } else if selectIndex == 0 {
                sync()
            } else {
                selectIndex = 2
                sync()
            }
        }
    }
}

