//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

extension EventModifiers: Hashable {}

public struct DeckStepperView: View {
	public let deck: [AnyView]
	public var animations: [(EventModifiers, Animation)]
	
	@State public var step: Int = 0

	public init(
		animations: [EventModifiers: Animation] = [
			[]: .default,
		   [.option]: .easeInOut(duration: 1),
		   [.command]: .instant
		],
		@DeckBuilder<AnyView> deck: () -> [AnyView])
	{
		self.deck = deck()
		
		self.animations = Array(animations).sorted { $0.key.rawValue < $1.key.rawValue }
	}
	
	public var body: some View {
		ZStack {
			VStack {
				deck[step]
			}

			ForEach(Array(animations), id: \.0) { (modifiers, animation) in
				Button.invisible {
					withAnimation(animation) {
						previous()
					}
				}.keyboardShortcut(.leftArrow, modifiers: modifiers)

				Button.invisible {
					withAnimation(animation) {
						next()
					}
				}.keyboardShortcut(.rightArrow, modifiers: modifiers)
			}
		}
	}
	
	public func previous() {
		step = max(step - 1, 0)
	}
	
	public func next() {
		step = min(step + 1, deck.count - 1)
	}
}

struct DeckStepper_Previews: PreviewProvider {
	static var previews: some View {
		DeckStepperView {
			Slide { Rectangle().fill(Color.red) }
			Slide { Rectangle().fill(Color.yellow) }
			Slide { Rectangle().fill(Color.green) }
			Slide { Rectangle().fill(Color.blue) }
		}
	}
}
