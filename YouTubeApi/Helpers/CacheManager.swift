//
//  CacheManager.swift
//  YouTubeApi
//
//  Created by Лілія on 22.02.2023.
//

import Foundation

class CacheManager {
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data:Data?){
        // store the image data and use the url as the key
        cache[url] = data
    }
    static func getVideoCache(_ url: String) -> Data?{
        // Try to get the data for the specified url
        return cache[url]
    }
    
}
