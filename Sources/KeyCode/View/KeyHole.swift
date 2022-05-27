//
//  KeyHole.swift
//  
//
//  Created by Lukas Tenbrink on 24.05.22.
//

import SwiftUI
import Carbon.HIToolbox.Events

public class KeyHole {
	public var capturedKeys: Set<UInt16>

	public var pressedKeys: Set<UInt16> = []

	public init(capturedKeys: Set<UInt16>) {
		self.capturedKeys = capturedKeys
	}
	
	public init(capturedKeys: Set<Int>) {
		self.capturedKeys = Set(capturedKeys.map(UInt16.init))
	}
	
	public lazy var view: ViewRepresentable = ViewRepresentable(keyHole: self)
	
	public func contains(_ keyCode: Int) -> Bool {
		pressedKeys.contains(UInt16(keyCode))
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
		}
	}
	
	public class View: NSView {
		public weak var keyHole: KeyHole?
		
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
	}
}

struct KeyHole_Previews: PreviewProvider {
	static var previews: some View {
		KeyHole(capturedKeys: [kVK_ANSI_A, kVK_ANSI_S]).view
	}
}
