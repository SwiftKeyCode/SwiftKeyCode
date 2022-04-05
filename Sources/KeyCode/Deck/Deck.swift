//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public protocol Deck {
	@DeckBuilder<AnyView> var steps: [AnyView] { get }
}
