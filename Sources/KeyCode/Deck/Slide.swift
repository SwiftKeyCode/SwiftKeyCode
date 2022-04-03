//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct Slide<V: View>: Deck {
	public var contents: V
	
	public init(@ViewBuilder _ contents: () -> V) {
		self.contents = contents()
	}

	public init(_ contents: V) {
		self.contents = contents
	}

	public var steps: [V] {
		return [contents]
	}
}