//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 16.06.21.
//

import SwiftUI

public extension Button where Label == Text {
	static func invisible(_ action: @escaping () -> Void) -> some View {
		Button("A", action: action)
			.padding(0)
			.opacity(0)
			.frame(width: 0, height: 0)
	}
}
