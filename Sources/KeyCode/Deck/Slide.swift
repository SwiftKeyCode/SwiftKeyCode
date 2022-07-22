//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct Slide<Content: View>: Deck {
	public var content: Content
	
	public init(@ViewBuilder _ content: () -> Content) {
		self.content = content()
	}

	public init(_ content: Content) {
		self.content = content
	}

	public var steps: [Content] {
		return [content]
	}
}
