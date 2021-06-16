//
//  StateDeck.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct StateDeck<Content: View, Yield>: View {
	public var objects: [Yield]
	@ViewBuilder public var content: (Yield) -> Content

	public init(_ objects: [Yield], @ViewBuilder content: @escaping (Yield) -> Content) {
		self.objects = objects
		self.content = content
	}
	
	public var body: some View {
		StepDeck(steps: objects.count) { idx in
			content(objects[idx])
		}
	}
}

public extension StateDeck where Yield: View, Yield == Content {
	static func view(_ objects: [Yield]) -> StateDeck {
		StateDeck(objects) { state in state }
	}
}

//struct StateDeck_Previews: PreviewProvider {
//    static var previews: some View {
//        StateDeck()
//    }
//}
