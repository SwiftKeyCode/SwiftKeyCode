//
//  SlideController.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct SlideController: View {
	@Environment(\.slideContext) var context
	
	public var animations: [EventModifiers: Animation] = [
		[]: .default,
		[.option]: .easeInOut(duration: 1),
		[.command]: .easeInOut(duration: 3)
	]
	
	public var body: some View {
		ZStack {
			ForEach(Array(animations.keys), id: \.rawValue) { modifiers in
				Button.invisible {
					_ = withAnimation(animations[modifiers]) {
						context?.previous()
					}
				}.keyboardShortcut(.leftArrow, modifiers: modifiers)

				Button.invisible {
					_ = withAnimation(animations[modifiers]) {
						context?.next()
					}
				}.keyboardShortcut(.rightArrow, modifiers: modifiers)
			}
		}
	}
}

extension EventModifiers: Hashable {}

public extension View {
	func withSlideController() -> some View {
		background(SlideController()).environment(\.slideContext, SlideContext(max: 0))
	}
}
