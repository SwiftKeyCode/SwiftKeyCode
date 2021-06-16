//
//  SlideBuilder.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

@resultBuilder
public struct AnyViewBuilder {
	static public func buildBlock() -> [AnyView] {
		[]
	}
}

extension AnyViewBuilder {
	public static func buildBlock<C0>(_ c0: C0) -> [AnyView] where C0 : View {
		[AnyView(c0)]
	}

	public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> [AnyView] where C0 : View, C1 : View {
		[AnyView(c0), AnyView(c1)]
	}

	public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> [AnyView] where C0 : View, C1 : View, C2 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2)]
	}
	
	
	public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6), AnyView(c7)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6), AnyView(c7), AnyView(c8)]
	}

	public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View {
		[AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3), AnyView(c4), AnyView(c5), AnyView(c6), AnyView(c7), AnyView(c8), AnyView(c9)]
	}
}
