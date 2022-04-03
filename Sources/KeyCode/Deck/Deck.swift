//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public protocol Deck {
	associatedtype Content: View
	
	@DeckBuilder var steps: [Content] { get }
}

public struct EmptyDeck: Deck {
	public var steps: [EmptyView] { return [] }
}
