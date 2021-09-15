//
//  SafariListViewController.swift
//  ScormTest
//
//  Created by Will Germano on 15/09/21.
//

import UIKit
import SafariServices

class SafariListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func goToSimpleGolf(_ sender: Any) {
        print("go to simple golf")
        let simpleGolf = ScormURLs.simpleGolf
        loadSFSafari(url: simpleGolf.rawValue)
    }
    @IBAction func goToGolfWithAlert(_ sender: Any) {
        print("go to Golf with alert")
        let golfWithAlert = ScormURLs.golfWithAlert
        loadSFSafari(url: golfWithAlert.rawValue)
    }
    @IBAction func goToBV(_ sender: Any) {
        print("go to BV")
        let bv = ScormURLs.bv
        loadSFSafari(url: bv.rawValue)
    }
    @IBAction func goToBVOpenedOnChrome(_ sender: Any) {
        print("go to BV opened on Chrome")
        let bvOpenedOnChrome = ScormURLs.bvOpenedOnChrome
        loadSFSafari(url: bvOpenedOnChrome.rawValue)
    }
    
    func loadSFSafari(url: String) {
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}
