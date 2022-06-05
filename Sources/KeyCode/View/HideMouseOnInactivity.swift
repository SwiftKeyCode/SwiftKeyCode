//
//  HideMouseOnInactivity.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 16.06.21.
//

import SwiftUI

#if !os(iOS)
import Cocoa

public struct HideMouseOnInactivity: NSViewRepresentable {
	public class View: NSView {
		private var trackingArea: NSTrackingArea?
		
		private var timer: Timer?
		public var seconds: TimeInterval = 1

		public override func updateTrackingAreas() {
			trackingArea.map(removeTrackingArea)
			// TODO How to update during drag?
			trackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .mouseMoved, .inVisibleRect, .activeInKeyWindow], owner: self, userInfo: nil)
			addTrackingArea(trackingArea!)
		}
		
		public override func mouseMoved(with event: NSEvent) {
			timer?.invalidate()
			timer = .scheduledTimer(withTimeInterval: seconds, repeats: true) { _ in
				NSCursor.setHiddenUntilMouseMoves(true)
			}
		}
		
		public override func mouseEntered(with event: NSEvent) {
			timer = .scheduledTimer(withTimeInterval: seconds, repeats: true) { _ in
				NSCursor.setHiddenUntilMouseMoves(true)
			}
		}
		
		public override func mouseExited(with event: NSEvent) {
			timer?.invalidate()
			timer = nil
		}
	}
	
	public var seconds: TimeInterval

	public func makeNSView(context: NSViewRepresentableContext<HideMouseOnInactivity>) -> View {
		View()
	}
	
	public func updateNSView(_ view: View, context: NSViewRepresentableContext<HideMouseOnInactivity>) {
		view.seconds = seconds
	}
}

public extension View {
	func hideMouseOnInactivity(seconds: TimeInterval) -> some View {
		background(HideMouseOnInactivity(seconds: seconds))
	}
}

struct HideMouseOnInactivity_Previews: PreviewProvider {
    static var previews: some View {
        HideMouseOnInactivity(seconds: 1)
    }
}

#endif
