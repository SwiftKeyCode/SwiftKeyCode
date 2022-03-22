//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct Slide<V: View>: AnyDeck {
	public var contents: V
	
	public init(_ contents: V) {
		self.contents = contents
	}
	
	public var steps: [AnyView] {
		return [AnyView(contents)]
	}
}
