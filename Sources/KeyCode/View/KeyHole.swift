//
//  KeyHole.swift
//  
//
//  Created by Lukas Tenbrink on 24.05.22.
//

import SwiftUI
import Carbon.HIToolbox.Events

public class KeyHole {
	public var capturedKeys: Set<UInt16> = []
	public var tracksMouse = false

	public var pressedKeys: Set<UInt16> = []
	public var mousePosition: NSPoint?

	public init(capturedKeys: Set<UInt16> = [], tracksMouse: Bool = false) {
		self.capturedKeys = capturedKeys
		self.tracksMouse = tracksMouse
	}
	
	public init(capturedKeys: Set<Int>, tracksMouse: Bool = false) {
		self.capturedKeys = Set(capturedKeys.map(UInt16.init))
		self.tracksMouse = tracksMouse
	}
	
	public lazy var view: ViewRepresentable = ViewRepresentable(keyHole: self)
	
	public func contains(_ keyCode: Int) -> Bool {
		pressedKeys.contains(UInt16(keyCode))
	}
	
	public func getAxis(positive: Int, negative: Int) -> Double {
		(contains(positive) ? 1 : 0) - (contains(negative) ? 1 : 0)
	}
}

extension KeyHole {
	public struct ViewRepresentable: NSViewRepresentable {
		public var keyHole: KeyHole

		public func makeNSView(context: NSViewRepresentableContext<ViewRepresentable>) -> View {
			KeyHole.View()
		}
		
		public func updateNSView(_ view: View, context: NSViewRepresentableContext<ViewRepresentable>) {
			view.keyHole = keyHole
			view.updateTrackingAreas()
		}
	}
	
	public class View: NSView {
		public weak var keyHole: KeyHole?
		
		var mouseTrackingArea: NSTrackingArea? {
			didSet {
				oldValue.map(removeTrackingArea)
				mouseTrackingArea.map(addTrackingArea)
			}
		}
				
		public override var acceptsFirstResponder: Bool {
			true
		}
		
		public override func keyDown(with event: NSEvent) {
			guard
				let keyHole = keyHole,
				keyHole.capturedKeys.contains(event.keyCode)
			else {
				return super.keyDown(with: event)
			}
			
			keyHole.pressedKeys.insert(event.keyCode)
		}
		
		public override func keyUp(with event: NSEvent) {
			guard
				let keyHole = keyHole,
				keyHole.capturedKeys.contains(event.keyCode)
			else {
				return super.keyDown(with: event)
			}

			keyHole.pressedKeys.remove(event.keyCode)
		}
		
		public override func updateTrackingAreas() {
			mouseTrackingArea = (keyHole?.tracksMouse ?? false)
				? NSTrackingArea(rect: bounds, options: [.activeAlways, .mouseMoved, .mouseEnteredAndExited], owner: self)
				: nil
			
			super.updateTrackingAreas()
		}
		
		private func updateMousePosition(with event: NSEvent) {
			let location = self.convert(event.locationInWindow, from: nil)
			keyHole?.mousePosition = CGPoint(x: location.x, y: bounds.size.height - location.y)
		}

		public override func mouseMoved(with event: NSEvent) {
			updateMousePosition(with: event)
		}
		
		public override func mouseEntered(with event: NSEvent) {
			updateMousePosition(with: event)
		}
		
		public override func mouseExited(with event: NSEvent) { keyHole?.mousePosition = nil }
	}
}

struct KeyHole_Previews: PreviewProvider {
	static var previews: some View {
		KeyHole(capturedKeys: [kVK_ANSI_A, kVK_ANSI_S]).view
	}
}
