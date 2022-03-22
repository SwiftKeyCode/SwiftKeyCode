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
	static func buildBlock(_ c0: AnyDeck) -> [AnyView] {
		[c0].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck) -> [AnyView] {
		[c0, c1].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck) -> [AnyView]{
		[c0, c1, c2].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck, _ c5: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck, _ c5: AnyDeck, _ c6: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck, _ c5: AnyDeck, _ c6: AnyDeck, _ c7: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck, _ c5: AnyDeck, _ c6: AnyDeck, _ c7: AnyDeck, _ c8: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7, c8].flatMap { $0.steps }
	}

	static func buildBlock(_ c0: AnyDeck, _ c1: AnyDeck, _ c2: AnyDeck, _ c3: AnyDeck, _ c4: AnyDeck, _ c5: AnyDeck, _ c6: AnyDeck, _ c7: AnyDeck, _ c8: AnyDeck, _ c9: AnyDeck) -> [AnyView] {
		[c0, c1, c2, c3, c4, c5, c6, c7, c8, c9].flatMap { $0.steps }
	}
}
