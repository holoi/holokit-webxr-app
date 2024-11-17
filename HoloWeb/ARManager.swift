// SPDX-FileCopyrightText: Copyright 2024 Reality Design Lab <dev@reality.design>
// SPDX-FileContributor: Yuchen Zhang <yuchen@reality.design>
// SPDX-License-Identifier: MIT

import ARKit

class ARManager {
    @MainActor static let shared = ARManager()
    private init() {}
    
    func StartARSession() {
        let session = ARSession()
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
    }
}
