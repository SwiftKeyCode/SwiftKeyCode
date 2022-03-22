//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct StepSlide<V: View>: AnyDeck {
	public var slides: [V]
	
	public init(_ range: Range<Int>, @ViewBuilder fun: (Int) -> V) {
		slides = range.map(fun)
	}
	
	public var steps: [AnyView] {
		return slides.map { AnyView($0) }
	}
}
