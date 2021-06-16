//
//  BlinkingView.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI
import Combine

extension View {
	func blinking(opacity: (Double, Double) = (0.2, 1)) -> some View {
		let change = opacity.1 - opacity.0
		return boomerangAnimation {
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

struct BoomerangView<V: View, M: View>: View {
	var content: V
	var modifier: (V, Double) -> M

	var animation: Animation = Animation.linear(duration: 0.6)

	@State var value: Double = 0
	
	init(
		content: V,
		modifier: @escaping (V, Double) -> M,
		animation: Animation = Animation.linear(duration: 0.6)
	) {
		self.content = content
		self.modifier = modifier
		self.animation = animation
		self._value = .init(initialValue: 0.0)
	}
	
	var body: some View {
		modifier(content, value)
			.onAppear {
				withAnimation(animation.repeatForever()) {
					value = 1
				}
			}
	}
}
