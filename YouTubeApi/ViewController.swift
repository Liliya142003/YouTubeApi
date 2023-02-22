//
//  ViewController.swift
//  YouTubeApi
//
//  Created by Лілія on 20.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set itself as a datasourse and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        // Set itself as a delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our video property
        self.videos = videos
        // Refresh the tableview
        tableView.reloadData()
    }
    //MARK: - TableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCell_Id, for: indexPath)
        
        // Configure the cell whith a data
        //Get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        //Return xell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}

