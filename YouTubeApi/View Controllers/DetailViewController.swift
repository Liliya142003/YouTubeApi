//
//  DetailViewController.swift
//  YouTubeApi
//
//  Created by Лілія on 22.02.2023.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        //Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //Check if there is a video
        guard video != nil else { return }
        
        //Create the embed URL
        let embedURL = Constants.yt_Embed_Url + video!.videoId
        
        // Load it into the webview
        let url = URL(string: embedURL)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        //Set the title
        titleLabel.text = video!.title
        
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //Set the description
        textView.text = video!.description
    }
}
