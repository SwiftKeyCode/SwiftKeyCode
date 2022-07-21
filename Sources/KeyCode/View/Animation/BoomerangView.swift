//
//  BlinkingView.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

//
//  BlinkingView.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI
import Combine

public extension View {
	func blinking(
		opacity: (Double, Double) = (0.2, 1),
		animation: Animation = Animation.linear(duration: 0.6)
	) -> some View {
		let change = opacity.1 - opacity.0
		return boomerangAnimation(animation: animation) {
			$0.opacity(opacity.0 + (change * $1))
		}
	}

	func boomerangAnimation<V: View>(
		animation: Animation = Animation.linear(duration: 0.6),
		autoreverses: Bool = true,
		isPlaying: Bool = true,
		modifier: @escaping (Self, Double) -> V
	) -> some View {
		BoomerangView(
			content: self,
			animation: animation,
			isPlaying: isPlaying,
			autoreverses: autoreverses,
			modifier: modifier
		)
	}
}

public struct BoomerangView<V: View, M: View>: View {
	public var content: V
	public var isPlaying: Bool
	public var modifier: (V, Double) -> M

	public var animation: Animation
	
	public var autoreverses: Bool

	@State public var value: Double = 0
	
	public init(
		content: V,
		animation: Animation = Animation.linear(duration: 0.6),
		isPlaying: Bool = true,
		autoreverses: Bool = true,
		modifier: @escaping (V, Double) -> M
	) {
		self.content = content
		self.isPlaying = isPlaying
		self.modifier = modifier
		self.animation = animation
		self._value = .init(initialValue: 0.0)
		self.autoreverses = autoreverses
	}
	
	public var body: some View {
		modifier(content, value)
			.onChange(of: isPlaying) { newValue in
				guard isPlaying != newValue else {
					// No change; continue
					return
				}
				
				// Reset State
				value = 0

				// Maybe restart animation
				if newValue {
					withAnimation(animation.repeatForever(autoreverses: autoreverses)) {
						value = 1
					}
				}
			}
			.onAppear() {
				withAnimation(animation.repeatForever(autoreverses: autoreverses)) {
					value = 1
				}
			}
	}
}

struct BoomerangView_Previews: PreviewProvider {
	static var previews: some View {
		DeckStepperView {
			Slide {
				Circle().fill(Color.red)
					.boomerangAnimation {
						$0.scaleEffect(x: 1 + CGFloat($1) * 0.02)
					}
			}
		}
	}
}
