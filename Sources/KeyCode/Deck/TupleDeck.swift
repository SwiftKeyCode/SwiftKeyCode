//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 03.04.22.
//

import SwiftUI

public struct TupleDeck2<V1: Deck, V2: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck3<V1: Deck, V2: Deck, V3: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck4<V1: Deck, V2: Deck, V3: Deck, V4: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck5<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4, V5)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck6<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4, V5, V6)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
			contents.5.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck7<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4, V5, V6, V7)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
			contents.5.steps.map { AnyView($0) },
			contents.6.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck8<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck, V8: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4, V5, V6, V7, V8)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
			contents.5.steps.map { AnyView($0) },
			contents.6.steps.map { AnyView($0) },
			contents.7.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

public struct TupleDeck9<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck, V8: Deck, V9: Deck>: Deck {
	public typealias Content = AnyView
	
	public var contents: (V1, V2, V3, V4, V5, V6, V7, V8, V9)
	
	public var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
			contents.5.steps.map { AnyView($0) },
			contents.6.steps.map { AnyView($0) },
			contents.7.steps.map { AnyView($0) },
			contents.8.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}
