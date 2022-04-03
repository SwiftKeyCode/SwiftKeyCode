//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 22.03.22.
//

import SwiftUI

public struct ForEachDeck<Data: RandomAccessCollection, Content: View>: Deck {
	public var data: Data
	public var fun: (Data.Element) -> Content
	
	public init(_ data: Data, @DeckBuilder fun: @escaping (Data.Element) -> Content) {
		self.data = data
		self.fun = fun
	}
	
	public var steps: [Content] {
		return data.map { fun($0) }
	}
}
