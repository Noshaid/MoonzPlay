//
//  ConnectivityService.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 04/09/2024.
//

import Foundation
import Network

class ConnectivityService {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    var isConnected: Bool = false
    var connectionStatusChanged: ((Bool) -> Void)?

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            let status = path.status == .satisfied
            self?.isConnected = status
            DispatchQueue.main.async {
                self?.connectionStatusChanged?(status)
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
