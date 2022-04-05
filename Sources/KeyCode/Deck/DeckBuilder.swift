//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

@resultBuilder
public struct DeckBuilder<T> {
	public static func buildBlock() -> [AnyView] {
		[]
	}
}

public extension DeckBuilder {
	static func buildBlock(_ c0: Deck) -> [AnyView] {
		[c0].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck) -> [AnyView] {
		[c0, c1].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck) -> [AnyView]{
		[c0, c1, c2].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck) -> [AnyView] {
		[c0, c1, c2, c3].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck, _ c5: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck, _ c5: Deck, _ c6: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck, _ c5: Deck, _ c6: Deck, _ c7: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck, _ c5: Deck, _ c6: Deck, _ c7: Deck, _ c8: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7, c8].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: Deck, _ c1: Deck, _ c2: Deck, _ c3: Deck, _ c4: Deck, _ c5: Deck, _ c6: Deck, _ c7: Deck, _ c8: Deck, _ c9: Deck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7, c8, c9].flatMap { $0.steps }
	}
}
