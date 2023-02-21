//
//  ViewController.swift
//  YouTubeApi
//
//  Created by Лілія on 20.02.2023.
//

import UIKit

class ViewController: UIViewController {
var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

