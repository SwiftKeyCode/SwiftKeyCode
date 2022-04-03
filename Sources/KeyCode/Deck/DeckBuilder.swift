//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

@resultBuilder
public struct DeckBuilder {
	static func buildBlock() -> EmptyDeck {
		.init()
	}

	static func buildBlock<Content: Deck>(_ c0: Content) -> Content {
		c0
	}
	
	public static func buildIf<Content>(_ content: Content?) -> Content? where Content: Deck {
		return content
	}
}
	
extension DeckBuilder {
	static func buildBlock<C0: Deck, C1: Deck>(_ c0: C0, _ c1: C1) -> TupleDeck2<C0, C1> {
		.init(contents: (c0, c1))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck>(_ c0: C0, _ c1: C1, _ c2: C2) -> TupleDeck3<C0, C1, C2> {
		.init(contents: (c0, c1, c2))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> TupleDeck4<C0, C1, C2, C3> {
		.init(contents: (c0, c1, c2, c3))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> TupleDeck5<C0, C1, C2, C3, C4> {
		.init(contents: (c0, c1, c2, c3, c4))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> TupleDeck6<C0, C1, C2, C3, C4, C5> {
		.init(contents: (c0, c1, c2, c3, c4, c5))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> TupleDeck7<C0, C1, C2, C3, C4, C5, C6> {
		.init(contents: (c0, c1, c2, c3, c4, c5, c6))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck, C7: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> TupleDeck8<C0, C1, C2, C3, C4, C5, C6, C7> {
		.init(contents: (c0, c1, c2, c3, c4, c5, c6, c7))
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck, C7: Deck, C8: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> TupleDeck9<C0, C1, C2, C3, C4, C5, C6, C7, C8> {
		.init(contents: (c0, c1, c2, c3, c4, c5, c6, c7, c8))
	}
}
