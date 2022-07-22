//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

extension EventModifiers: Hashable {}

public struct DeckStepperView<Content: View>: View {
	@ObservedObject public var deckStepper: DeckStepper<Content>
	public var animations: [(EventModifiers, Animation)]

	public init(
		animations: [EventModifiers: Animation] = [
			[]: .default,
			[.option]: .easeInOut(duration: 1),
			[.command]: .instant
		],
		@DeckBuilder<Content> deck: () -> [Content])
	{
		self.deckStepper = DeckStepper(deck: deck)
		
		self.animations = Array(animations).sorted { $0.key.rawValue < $1.key.rawValue }
	}
	
	public var body: some View {
		deckStepper.currentView.background(
			Controls(deckStepper: deckStepper, animations: animations)
		)
	}
}

extension DeckStepperView {
	struct Controls: View {
		// This class does not observe DeckStepper and will thus not be re-generated.
		// This helps with SwiftUI being confused and re-creating buttons sometimes,
		// offering them up for re-trigger.
		public var deckStepper: DeckStepper<Content>
		public var animations: [(EventModifiers, Animation)]

		public var body: some View {
			ForEach(Array(animations), id: \.0) { (modifiers, animation) in
				Button.invisible {
					withAnimation(animation) {
						deckStepper.previous()
					}
				}.keyboardShortcut(.leftArrow, modifiers: modifiers)

				Button.invisible {
					withAnimation(animation) {
						deckStepper.next()
					}
				}.keyboardShortcut(.rightArrow, modifiers: modifiers)
			}
		}
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

		DeckStepperView {
			Slide { Rectangle().fill(Color.red) }
			Slide { Rectangle().fill(Color.yellow) }
			Slide { Rectangle().fill(Color.green) }
			Slide { Rectangle() }
		}
	}
}
