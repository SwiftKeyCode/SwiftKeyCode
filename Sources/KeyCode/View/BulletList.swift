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
	@ViewBuilder public var content: (inout Builder) -> Content
	
	public init(_ bullet: @escaping Builder.Function, @ViewBuilder content: @escaping (inout Builder) -> Content) {
		self.bullet = bullet
		self.content = content
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			var builder = BulletBuilder(bullet: bullet)
			content(&builder)
		}
	}
}

public struct BulletBuilder<Bullet: View> {
	public typealias Function = (Int) -> Bullet
	
	public var bullet: Function
	public var n = 0
	
	public mutating func callAsFunction<Content: View>(@ViewBuilder content: () -> Content) -> some View {
		let currentN = n
		n += 1
		return HStack(alignment: .top, spacing: nil) {
			bullet(currentN)
			
			VStack(alignment: .leading) {
				content()
			}
		}
	}
}

public extension BulletBuilder where Bullet == Text {
	static func dot(_ n: Int) -> some View {
		Text("•")
	}
	
	static func numbered(_ n: Int) -> some View {
		let suffix = "." // TODO Make configurable
		return Text("\(n + 1)\(suffix)")
	}
}

struct BulletList_Previews: PreviewProvider {
    static var previews: some View {
		BulletList(BulletBuilder.numbered) { bullet in
			bullet {
				Text("Test 1 that is kinda long").frame(width: 70)
			}

			bullet {
				Text("Test 2")
			}
		}
    }
}
