//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct Deck<V: View>: AnyDeck {
	public var contents: [AnyView]
	
	public init(@DeckBuilder<AnyView> _ contents: () -> [AnyView]) {
		self.contents = contents()
	}
	
	public var steps: [AnyView] {
		return contents
	}
}
