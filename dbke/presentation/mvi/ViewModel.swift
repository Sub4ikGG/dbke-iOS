//
//  ViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class ViewModel <S: MVIState, I: MVIIntent, E: MVIEffect> : ObservableObject {
    @Published public private(set) var state: S
    @Published public private(set) var effect: E? = nil
    
    public init(initialState: S) {
        self.state = initialState
    }
    
    open func obtainIntent(intent: I) {}
    
    public func updateState(state: S) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
    
    public func updateEffect(effect: E) {
        DispatchQueue.main.async {
            self.effect = effect
        }
    }
}
