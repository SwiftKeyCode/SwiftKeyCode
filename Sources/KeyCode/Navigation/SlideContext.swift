//
//  SlideController.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct SlideContextEnvironmentKey: EnvironmentKey {
	static public let defaultValue: SlideContext? = nil
}

public extension EnvironmentValues {
	var slideContext: SlideContext? {
		get { self[SlideContextEnvironmentKey] }
		set { self[SlideContextEnvironmentKey] = newValue }
	}
}

public class SlideContext: ObservableObject {
	public let max: Int
	
	public var isMovingBackwards = false
	@Published public var current: Int = 0
	
	public weak var child: SlideContext? = nil
	
	public init(max: Int, current: Int = 0) {
		self.max = max
		self.current = current
	}
	
	public var hasNext: Bool { (child?.hasNext ?? false) || (current < max - 1) }
	
	@discardableResult
	public func next() -> Bool {
		isMovingBackwards = false
		
		if let child = child, child.next() {
			return true
		}

		guard hasNext else {
			return false
		}
		
		current += 1
		return true
	}
	
	public var hasPrevious: Bool { (child?.hasPrevious ?? false) || (current > 0) }

	@discardableResult
	public func previous() -> Bool {
		isMovingBackwards = true
		
		if let child = child, child.previous() {
			return true
		}

		guard hasPrevious else {
			return false
		}
				
		current -= 1
		return true
	}
	
	public func makeChild(max: Int) -> SlideContext {
		let child = SlideContext(max: max, current: isMovingBackwards ? max - 1 : 0)
		self.child = child
		child.isMovingBackwards = isMovingBackwards
		return child
	}
}
