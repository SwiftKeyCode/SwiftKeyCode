//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct SequenceDeck<V: View>: Deck {
	public var contents: [V]
	
	public init(@DeckBuilder<AnyView> _ contents: () -> [V]) {
		self.contents = contents()
	}
	
	public init(_ contents: [V]) {
		self.contents = contents
	}

	public var steps: [AnyView] {
		return contents.map { AnyView($0) }
	}
}
