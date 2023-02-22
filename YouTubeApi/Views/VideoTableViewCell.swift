//
//  VideoTableViewCell.swift
//  YouTubeApi
//
//  Created by Лілія on 22.02.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailmageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var video: Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setCell(_ v: Video){
        
        self.video = v
        guard self.video != nil else {return}
        
        //Set the title
        self.titleLabel.text = video?.title
        
        // Set the date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {return}
        
        // Check cache before the downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            
            // set the thumbnail imageview
            self.thumbnailmageView.image = UIImage(data: cacheData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data,  response, error ) in
            if error == nil && data != nil {
                
                // save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thunbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for another video and nolonger matches the thubnail that was downloaded
                    return
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                //Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailmageView.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }
}
