//
//  ViewControllerExtension.swift
//  ScormTest
//
//  Created by Will Germano on 15/09/21.
//

import UIKit

extension UIViewController {
    func navigateTo(with url: String, to viewControllerId: String, storyboardId: String = "Main") {
        let storyBoard : UIStoryboard = UIStoryboard(name: storyboardId, bundle:nil)
        let webViewController = storyBoard.instantiateViewController(withIdentifier: viewControllerId) as! WebViewController
        webViewController.urlString = url
        self.present(webViewController, animated:true, completion:nil)
    }
}
