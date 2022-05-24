//
//  SwiftUIView.swift
//  
//
//  Created by Lukas Tenbrink on 24.05.22.
//

import SwiftUI

struct TickingView: NSViewControllerRepresentable {
	var timeInterval: TimeInterval? = nil
	var tick: (() -> Void)? = nil

	var construct: (() -> Void)? = nil
	var destruct: (() -> Void)? = nil

	func makeNSViewController(context: Context) -> ViewController {
		ViewController()
	}
	
	func updateNSViewController(_ nsViewController: ViewController, context: Context) {
		nsViewController.construct = construct
		nsViewController.destruct = destruct

		nsViewController.timeInterval = timeInterval
		nsViewController.tick = tick
	}

	class ViewController: NSViewController {
		var timeInterval: TimeInterval?
		var tick: (() -> Void)? = nil

		var construct: (() -> Void)? = nil
		var destruct: (() -> Void)? = nil

		var timer: Timer?
		
		init() {
			super.init(nibName: nil, bundle: nil)
			self.view = NSView()
		}

		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		override func viewWillAppear() {
			super.viewWillAppear()
			
			construct?()
			
			if let tick = tick, let timeInterval = timeInterval {
				timer = .scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
					tick()
				}
			}
		}

		override func viewWillDisappear() {
			super.viewWillDisappear()
			
			timer?.invalidate()
			timer = nil
			
			destruct?()
		}
	}
}

extension View {
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
