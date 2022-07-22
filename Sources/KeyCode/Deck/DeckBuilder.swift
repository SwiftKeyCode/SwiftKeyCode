//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

@resultBuilder
public struct DeckBuilder<C: View> {
	public static func buildBlock() -> [EmptyView] {
		[]
	}
}

public extension DeckBuilder {
	static func buildBlock<C0: Deck>(_ c0: C0) -> [C] where C0.Content == C {
		c0.steps
	}

	// Unfortunately, these functions interfere with the AnyView functions - the compiler can never decide
	// which to use. We can't add these functions because the AnyView functions must be included. Otherwise,
	// it would be up to the user to wrap his views with AnyView - which would be annoying.
	// Update: It seems they are never used, currently.
	
//	static func buildBlock<C0: Deck, C1: Deck>(_ c0: C0, _ c1: C1) -> [C] where C0.Content == C, C1.Content == C {
//		[c0.steps, c1.steps].flatMap { $0 }
//	}
//
//	static func buildBlock<C0: Deck, C1: Deck, C2: Deck>(_ c0: C0, _ c1: C1, _ c2: C2) -> [C] where C0.Content == C, C1.Content == C, C2.Content == C {
//		[c0.steps, c1.steps, c2.steps].flatMap { $0 }
//	}
//
//	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [C] where C0.Content == C, C1.Content == C, C2.Content == C, C3.Content == C {
//		[c0.steps, c1.steps, c2.steps, c3.steps].flatMap { $0 }
//	}
}

// Yes it's horrible.
// But don't judge me before you view the definition for ViewBuilder. lol
public extension DeckBuilder where C == AnyView {
	static func buildBlock<C0: Deck, C1: Deck>(_ c0: C0, _ c1: C1) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck>(_ c0: C0, _ c1: C1, _ c2: C2) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
			c5.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
			c5.steps.map { AnyView($0) },
			c6.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck, C7: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
			c5.steps.map { AnyView($0) },
			c6.steps.map { AnyView($0) },
			c7.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck, C7: Deck, C8: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
			c5.steps.map { AnyView($0) },
			c6.steps.map { AnyView($0) },
			c7.steps.map { AnyView($0) },
			c8.steps.map { AnyView($0) },
		].flatMap { $0 }
	}

	static func buildBlock<C0: Deck, C1: Deck, C2: Deck, C3: Deck, C4: Deck, C5: Deck, C6: Deck, C7: Deck, C8: Deck, C9: Deck>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> [AnyView] {
		[
			c0.steps.map { AnyView($0) },
			c1.steps.map { AnyView($0) },
			c2.steps.map { AnyView($0) },
			c3.steps.map { AnyView($0) },
			c4.steps.map { AnyView($0) },
			c5.steps.map { AnyView($0) },
			c6.steps.map { AnyView($0) },
			c7.steps.map { AnyView($0) },
			c8.steps.map { AnyView($0) },
			c9.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}
