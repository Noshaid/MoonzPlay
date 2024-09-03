//
//  DownloadManager.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 02/09/2024.
//

import Foundation
import UIKit
import Photos
import Alamofire

class DownloadManager {
    
    static let shared = DownloadManager()
    private let videoURL = _SAMPLE_VIDEO_URL
    
    private init() {}
    
    func downloadAndSaveVideo() {
        let url = URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4")!
        AF.download(url).downloadProgress { progress in
            DispatchQueue.main.async {
                print("Download Progress: \(progress.fractionCompleted * 100)%")
            }
        }.responseURL { response in
            if let tempURL = response.fileURL {
                PHPhotoLibrary.requestAuthorization { status in
                    if status == .authorized {
                        self.saveVideoToGallery(from: tempURL)
                    } else {
                        print("Permission denied to access the photo library")
                    }
                }
            } else if let error = response.error {
                print("Error downloading video: \(error.localizedDescription)")
            }
        }
    }

    func saveVideoToGallery(from url: URL) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
        }) { saved, error in
            if saved {
                print("Video saved successfully to gallery")
            } else {
                print("Error saving video to gallery: \(error?.localizedDescription ?? "error")")
            }
        }
    }
}
