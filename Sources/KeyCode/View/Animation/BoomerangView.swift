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
		modifier: @escaping (Self, Double) -> V
	) -> some View {
		BoomerangView(content: self, modifier: modifier, animation: animation)
	}
}

public struct BoomerangView<V: View, M: View>: View {
	public var content: V
	public var modifier: (V, Double) -> M

	public var animation: Animation = Animation.linear(duration: 0.6)

	@State public var value: Double = 0
	
	public init(
		content: V,
		modifier: @escaping (V, Double) -> M,
		animation: Animation = Animation.linear(duration: 0.6)
	) {
		self.content = content
		self.modifier = modifier
		self.animation = animation
		self._value = .init(initialValue: 0.0)
	}
	
	public var body: some View {
		modifier(content, value)
			.onAppear {
				withAnimation(animation.repeatForever()) {
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
