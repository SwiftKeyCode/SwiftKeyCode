//
//  Sequencer.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 16.06.21.
//

import Foundation

public struct Sequencer<State> {
	private var array: [State]
	private var pushed: [State] = []
	
	public init(initialState: State) {
		array = [initialState]
	}
	
	public var asArray: [State] { array }

	public mutating func set(_ state: State) {
		array.append(state)
	}
	
	public mutating func next(_ fun: (inout State) -> Void) {
		var x = array.last!
		fun(&x)
		array.append(x)
	}
	
	public mutating func temporary(_ fun: (inout Sequencer) -> Void) {
		pushed.append(array.last!)
		
		fun(&self)
		
		set(pushed.removeLast())
	}
	
	public subscript<T>(_ key: WritableKeyPath<State, T>) -> T {
		get { array.last![keyPath: key] }
		set { next { $0[keyPath: key] = newValue } }
	}
}
