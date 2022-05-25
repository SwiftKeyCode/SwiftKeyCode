//
//  SwiftUIView.swift
//  
//
//  Created by Lukas Tenbrink on 24.05.22.
//

import SwiftUI

public struct TickingView: NSViewControllerRepresentable {
	public var timeInterval: TimeInterval? = nil
	public var tick: (() -> Void)? = nil

	public var construct: (() -> Void)? = nil
	public var destruct: (() -> Void)? = nil

	public func makeNSViewController(context: Context) -> ViewController {
		ViewController()
	}
	
	public func updateNSViewController(_ nsViewController: ViewController, context: Context) {
		nsViewController.construct = construct
		nsViewController.destruct = destruct

		nsViewController.timeInterval = timeInterval
		nsViewController.tick = tick
	}
}

public extension TickingView {
	class ViewController: NSViewController {
		public var timeInterval: TimeInterval?
		public var tick: (() -> Void)? = nil

		public var construct: (() -> Void)? = nil
		public var destruct: (() -> Void)? = nil

		public var timer: Timer?
		
		public init() {
			super.init(nibName: nil, bundle: nil)
			self.view = NSView()
		}

		public required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		public override func viewWillAppear() {
			super.viewWillAppear()
			
			construct?()
			
			if let tick = tick, let timeInterval = timeInterval {
				timer = .scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
					tick()
				}
			}
		}

		public override func viewWillDisappear() {
			super.viewWillDisappear()
			
			timer?.invalidate()
			timer = nil
			
			destruct?()
		}
	}
}

public extension View {
	func ticking(
		atInterval timeInterval: TimeInterval,
		construct: (() -> Void)? = nil,
		destruct: (() -> Void)? = nil,
		tick: @escaping () -> Void
	) -> some View {
		background(TickingView(
			timeInterval: timeInterval, tick: tick, construct: construct, destruct: destruct
		))
	}
}
