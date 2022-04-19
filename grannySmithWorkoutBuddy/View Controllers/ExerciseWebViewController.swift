/*
 Author: Christopher Lewis
 The code below is used to control the Exercise Web Page View Controller. The goal of the view controller is to display the website link associated with each exercise entry.
 */

import UIKit
import WebKit

class ExerciseWebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    //if the view loads successfully then get the url address for the associated table entry from the AppDelegate. Then load the web page.
    override func viewDidLoad() {
        super.viewDidLoad()

        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let urlAddress = URL(string: mainDelegate.selectedURL)
        
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
    }
    
    //start the web page loading animation and show the element
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.startAnimating()
        activity.isHidden = false
    }
    
    //end the web page loading animation and hide the element
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.isHidden = true
    }

}
