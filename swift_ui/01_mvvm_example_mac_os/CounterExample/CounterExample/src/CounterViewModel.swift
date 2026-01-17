//
//  CounterViewModel.swift
//  CounterExample
//
//  Created by Виталий Цыганенко on 18.01.2026.
//

import SwiftUI

class CounterViewModel : ObservableObject {
    @Published private(set) var counter: Int = 0
    
    private let service: CounterService
    
    init() {
        self.service = CounterService()
    }
    
    func increment() {
        counter = service.increment(counter)
    }
    
    func decrement() {
        counter = service.decrement(counter)
    }
}
