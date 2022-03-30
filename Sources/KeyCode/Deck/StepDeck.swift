//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct StepDeck<V: View>: AnyDeck {
	public var states: [V]
	
	public init(_ range: Range<Int>, @DeckBuilder<AnyView> fun: (Int) -> [V]) {
		states = range.flatMap(fun)
	}
	
	public var steps: [AnyView] {
		return states.map { AnyView($0) }
	}
}
