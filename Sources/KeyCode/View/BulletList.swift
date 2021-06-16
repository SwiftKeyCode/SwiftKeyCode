//
//  BulletList.swift
//  Game Presentation 1
//
//  Created by Lukas Tenbrink on 15.06.21.
//

import SwiftUI

public struct BulletList<Bullet: View, Content: View>: View {
	public typealias Builder = BulletBuilder<Bullet>
	
	public var bullet: Builder.Function
	@ViewBuilder public var content: (Builder) -> Content
	
	public init(_ bullet: @escaping Builder.Function, content: @escaping (Builder) -> Content) {
		self.bullet = bullet
		self.content = content
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			content(BulletBuilder(bullet: bullet))
		}
	}
}

public struct BulletBuilder<Bullet: View> {
	public typealias Function = (Int) -> Bullet
	
	public var bullet: Function
	
	public func callAsFunction<Content: View>(_ n: Int, @ViewBuilder content: () -> Content) -> some View {
		HStack(alignment: .top, spacing: nil) {
			bullet(n)
			
			content()
		}
	}
}

public extension BulletBuilder where Bullet == Text {
	static func dot(_ n: Int) -> some View {
		Text("•")
	}
	
	static func numbered(_ n: Int, suffix: String = ".") -> some View {
		Text("\(n + 1)\(suffix)")
	}
}

//struct BulletList_Previews: PreviewProvider {
//    static var previews: some View {
//		BulletList.numbered { _ in
//			Text("Test 1 that is kinda long").frame(width: 70)
//
//			Text("Test 2")
//		}
//    }
//}
