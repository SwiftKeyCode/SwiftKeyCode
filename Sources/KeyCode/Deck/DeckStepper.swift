//
//  DeckStepper.swift
//  
//
//  Created by Lukas Tenbrink on 06.06.22.
//

import SwiftUI

public class DeckStepper: ObservableObject {
	public let deck: [AnyView]
	
	@State public var step: Int = 0
	
	public init(
		@DeckBuilder<AnyView> deck: () -> [AnyView])
	{
		self.deck = deck()
	}
	
	public var currentView: AnyView {
		deck[step]
	}
	
	public func previous() {
		step = max(step - 1, 0)
	}
	
	public func next() {
		step = min(step + 1, deck.count - 1)
	}
}
