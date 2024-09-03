//
//  VideoPlayerViewController.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 02/09/2024.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    
    private var videoURL: URL?

    init(videoURL: URL? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.videoURL = videoURL
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let videoURL = videoURL else { return }

        let player = AVPlayer(url: videoURL)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        
        // Add the player view controller as a child view controller
        addChild(playerVC)
        playerVC.view.frame = view.bounds
        view.addSubview(playerVC.view)
        playerVC.didMove(toParent: self)
        
        // Play the video
        player.play()
    }
}
