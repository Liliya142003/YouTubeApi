//
//  Constans.swift
//  YouTubeApi
//
//  Created by Лілія on 20.02.2023.
//

import Foundation
struct Constants {
    static var apiKey = "AIzaSyCydrsO7r0h5ctOAkwDnOZ-tx8cYph5jRs"
    static var playlistId = "UULFTgp1pyh6j1onqSlotnRuAA"
    static var apiUrl = "https://youtube.googleapis.com/youtube/v3/playlistItems?playlistId=\(Constants.playlistId)&key=\(Constants.apiKey)"
}
