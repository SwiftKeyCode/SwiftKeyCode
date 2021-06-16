//
//  SlideController.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct SlideController: View {
	@Environment(\.slideContext) var context
	
	public var animations: [(EventModifiers, Animation)]
	
	public init(
		animations: [EventModifiers: Animation] = [
			[]: .default,
			[.option]: .easeInOut(duration: 1),
			[.command]: .easeInOut(duration: 3),
			[.shift]: .instant
		 ]
	) {
		self.animations = Array(animations).sorted { $0.key.rawValue < $1.key.rawValue }
	}
	
	public var body: some View {
		ZStack {
			ForEach(Array(animations), id: \.0) { (modifiers, animation) in
				Button.invisible {
					_ = withAnimation(animation) {
						context?.previous()
					}
				}.keyboardShortcut(.leftArrow, modifiers: modifiers)

				Button.invisible {
					_ = withAnimation(animation) {
						context?.next()
					}
				}.keyboardShortcut(.rightArrow, modifiers: modifiers)
			}
		}
	}
}

extension EventModifiers: Hashable {}

public extension View {
	func withSlideController(_ controller: SlideController = SlideController()) -> some View {
		background(controller).environment(\.slideContext, SlideContext(max: 0))
	}
}
