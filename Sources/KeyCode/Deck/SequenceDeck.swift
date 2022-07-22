//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct SequenceDeck<Content: View>: Deck {
	public var contents: [Content]
	
	public init(@DeckBuilder<Content> _ contents: () -> [Content]) {
		self.contents = contents()
	}
	
	public init(_ contents: [Content]) {
		self.contents = contents
	}

	public var steps: [Content] {
		return contents
	}
}
