//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 05.04.22.
//

import SwiftUI

public struct EmptyDeck: Deck {
	public var steps: [AnyView] { return [] }
}
