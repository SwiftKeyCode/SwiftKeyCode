//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct StepDeck: AnyDeck {
	public var states: [AnyDeck]
	
	public init(_ range: Range<Int>, fun: (Int) -> AnyDeck) {
		states = range.map(fun)
	}
	
	public var steps: [AnyView] {
		return states.flatMap { $0.steps }
	}
}
