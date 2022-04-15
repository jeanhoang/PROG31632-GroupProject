//
//  ExerciseWebViewController.swift
//  grannySmithWorkoutBuddy
//
//  Created by Christopher Lewis on 2022-04-14.
//

import UIKit
import WebKit

class ExerciseWebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let urlAddress = URL(string: mainDelegate.selectedURL)
        
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.startAnimating()
        activity.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
