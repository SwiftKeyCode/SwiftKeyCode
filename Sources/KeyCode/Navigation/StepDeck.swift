//
//  SlideDeck.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct StepDeck<Content: View>: View {
	public struct ContentView<Content: View>: View {
		@Environment(\.slideContext) public var context

		@ViewBuilder public var content: (Int) -> Content

		@State private var slide = 0

		public var body: some View {
			content(slide)
				.onReceive(context!.$current) { self.slide = $0 }
		}
	}
	
	@Environment(\.slideContext) public var parentContext
	
	public var steps: Int
	@ViewBuilder public var content: (Int) -> Content

	public init(steps: Int, content: @escaping (Int) -> Content) {
		self.steps = steps
		self.content = content
	}
	
	public var body: some View {
		ContentView(content: content)
			.environment(\.slideContext, parentContext?.makeChild(max: steps))
    }
}

//struct SlideDeck_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideDeck()
//    }
//}
