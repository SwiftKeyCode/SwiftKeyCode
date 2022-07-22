//
//  DeckStepper.swift
//  
//
//  Created by Lukas Tenbrink on 06.06.22.
//

import SwiftUI

public class DeckStepper<Content: View>: ObservableObject {
	public let deck: [Content]
	
	public var step: Int = 0 {
		willSet { objectWillChange.send() }
	}
	
	public init(
		@DeckBuilder<Content> deck: () -> [Content])
	{
		self.deck = deck()
	}
	
	public var currentView: Content {
		deck[step]
	}
	
	public func previous() {
		step = max(step - 1, 0)
	}
	
	public func next() {
		step = min(step + 1, deck.count - 1)
	}
}
