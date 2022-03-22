//
//  LaTeXView.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 16.06.21.
//

import SwiftUI

public struct LaTeXView: View {
	public var text: String
	public var color: Color
	public var fontSize: String

	public init(text: String, color: Color = .primary, fontSize: String = "40px") {
		self.text = text
		self.color = color
		self.fontSize = fontSize
	}
	
	public var body: some View {
		let rgba = color.rgba

		let r = Int(round(rgba.red * 255))
		let g = Int(round(rgba.green * 255))
		let b = Int(round(rgba.blue * 255))

		OfflineWebView(html:
			"""
			<html>
			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width">
				<script>MathJax = {
					tex: {
						inlineMath: [['$', '$'], ['\\(', '\\)']],
						tags: 'ams'
					},
					svg: {
						fontCache: 'global'
					}
				};
				</script>
				<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
				<script id="MathJax-script" async
					src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
				</script>
			</head>
			<body>
				<p style="color: rgb(\(r), \(g), \(b)); font-size: \(fontSize);">
					\(text)
				</p>
			</body>
			</html>
			"""
		)
    }
}

struct LaTeXView_Previews: PreviewProvider {
    static var previews: some View {
        LaTeXView(text: "$a * b$")
    }
}
