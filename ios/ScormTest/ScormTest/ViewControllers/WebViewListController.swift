//
//  WebViewListController.swift
//  ScormTest
//
//  Created by Will Germano on 14/09/21.
//

import UIKit

class WebViewListController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var simpleGolfButton: UIButton!
    @IBOutlet weak var golfWithAlertButton: UIButton!
    @IBOutlet weak var bvButton: UIButton!
    @IBOutlet weak var bvOpenedOnChrome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func goToSimpleGolf(_ sender: Any) {
        print("Go to simple golf")
        let simpleGolf = ScormURLs.simpleGolf
        navigateTo(with: simpleGolf.rawValue, to: "WebView")
    }
    
    @IBAction func goToGolfWithAlert(_ sender: Any) {
        print("Go to golf with alert")
        let golfWithAlert = ScormURLs.golfWithAlert
        navigateTo(with: golfWithAlert.rawValue, to: "WebView")
    }
    
    @IBAction func goToBv(_ sender: Any) {
        print("Go to BV")
        let bv = ScormURLs.bv
        navigateTo(with: bv.rawValue, to: "WebView")
    }
    
    @IBAction func goToBvOpenedOnChrome(_ sender: Any) {
        print("Go to BV opened on Chrome")
        let bvOpenedOnChrome = ScormURLs.bvOpenedOnChrome
        navigateTo(with: bvOpenedOnChrome.rawValue, to: "WebView")
    }
}
