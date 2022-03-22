//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public protocol AnyDeck {
	@DeckBuilder<AnyView> var steps: [AnyView] { get }
}

public struct EmptyDeck: AnyDeck {
	public var steps: [AnyView] { return [] }
}
