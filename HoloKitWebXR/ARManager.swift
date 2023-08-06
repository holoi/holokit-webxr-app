//
//  ARManager.swift
//  HoloKitWebXR
//
//  Created by Yuchen Zhang on 2023/8/2.
//

import ARKit

class ARManager {
    static let shared = ARManager()
    private init() {}
    
    func StartARSession() {
        let session = ARSession()
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
}
