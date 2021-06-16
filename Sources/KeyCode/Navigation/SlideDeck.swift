//
//  SlideDeck.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct SlideDeck: View {
	@AnyViewBuilder public var views: () -> [AnyView]
	
	public var body: some View {
		let views = self.views()
		
		StepDeck(steps: views.count) { idx in
			views[idx].id(idx)
		}
	}
}

//struct SlideDeck_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideDeck()
//    }
//}
