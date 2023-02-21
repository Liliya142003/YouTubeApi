//
//  Model.swift
//  YouTubeApi
//
//  Created by Лілія on 20.02.2023.
//

import Foundation
class Model {
    func getVideos() {
        // create url object
        let url = URL(string: Constants.apiUrl)
        guard url != nil else {return}
        // Get a URLSession object
        let session = URLSession.shared
        //Get a data task from a URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error ) in
            //Check if there were any  errors
            if error != nil || data == nil {
                return
            }
            // Parsing the data
            
        }
        // Kick off the task
        dataTask.resume()
    }
}
