//
//  DownloadManager.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 02/09/2024.
//

import Foundation
import UIKit
import Photos

class DownloadManager {
    
    static let shared = DownloadManager()
    private let videoURL = _SAMPLE_LIGHTWEIGHT_VIDEO_URL
    
    private init() {}
    
    func downloadAndSaveVideo(compeletion: @escaping (Bool) -> Void) {
        let url = URL(string: videoURL)!
        
        URLSession.shared.downloadTask(with: url) { [weak self] (location, response, error) in
            guard let location = location, error == nil else {
                print("Error downloading video: \(String(describing: error))")
                compeletion(false)
                return
            }

            // Move the downloaded file to a temporary location
            let fileManager = FileManager.default
            let destinationURL = fileManager.temporaryDirectory.appendingPathComponent(response?.suggestedFilename ?? url.lastPathComponent)

            do {
                // Remove any existing file if any
                if fileManager.fileExists(atPath: destinationURL.path) {
                    try fileManager.removeItem(at: destinationURL)
                }
                try fileManager.moveItem(at: location, to: destinationURL)
                self?.saveVideoInGallery(url: destinationURL, compeletion: compeletion)
            } catch {
                print("Error moving file: \(error)")
                compeletion(false)
            }
        }.resume()
    }
    
    private func saveVideoInGallery(url: URL, compeletion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
        }) { success, error in
            if success {
                print("Video saved to gallery successfully!")
                compeletion(true)
            } else {
                print("Error saving video to gallery: \(String(describing: error))")
                compeletion(false)
            }
        }
    }
}
