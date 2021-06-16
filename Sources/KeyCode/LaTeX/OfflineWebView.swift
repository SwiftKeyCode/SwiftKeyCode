//
//  OfflineWebView.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 16.06.21.
//

import WebKit
import SwiftUI

public class UninteractableWebView: WKWebView {
	public override var acceptsFirstResponder: Bool { false }
}

public struct OfflineWebView: View, NSViewRepresentable {
	public var html: String
		
	public func makeNSView(context: NSViewRepresentableContext<OfflineWebView>) -> WKWebView {
		let configuration = WKWebViewConfiguration()

		var requiresDrawBackgroundFallback = false
		
		if #available(OSX 10.14, *) {
			configuration.setValue(false, forKey: "sward".reversed() + "background".capitalized) //drawsBackground KVC hack; works but private
		} else {
			requiresDrawBackgroundFallback = true
		}
		
		let view = UninteractableWebView(frame: .zero, configuration: configuration)
		
		if requiresDrawBackgroundFallback {
			view.setValue(false, forKey: "sward".reversed() + "background".capitalized) //drawsBackground KVC hack; works but private
		}
		
		return view
	}
	
	public func updateNSView(_ view: WKWebView, context: NSViewRepresentableContext<OfflineWebView>) {
		view.loadHTMLString(html, baseURL: nil)
	}
}

