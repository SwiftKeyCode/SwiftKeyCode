//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public protocol Deck {
	associatedtype Content: View
	
	@DeckBuilder<Content> var steps: [Content] { get }
}
