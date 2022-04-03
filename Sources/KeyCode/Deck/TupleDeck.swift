//
//  File.swift
//  
//
//  Created by Lukas Tenbrink on 03.04.22.
//

import SwiftUI

struct TupleDeck2<V1: Deck, V2: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2)
	
	var steps: [Content] {		
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

struct TupleDeck3<V1: Deck, V2: Deck, V3: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3)
	
	var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

struct TupleDeck4<V1: Deck, V2: Deck, V3: Deck, V4: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4)
	
	var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

struct TupleDeck5<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4, V5)
	
	var steps: [Content] {
		return [
			contents.0.steps.map { AnyView($0) },
			contents.1.steps.map { AnyView($0) },
			contents.2.steps.map { AnyView($0) },
			contents.3.steps.map { AnyView($0) },
			contents.4.steps.map { AnyView($0) },
		].flatMap { $0 }
	}
}

struct TupleDeck6<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4, V5, V6)
	
	var steps: [Content] {
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

struct TupleDeck7<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4, V5, V6, V7)
	
	var steps: [Content] {
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

struct TupleDeck8<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck, V8: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4, V5, V6, V7, V8)
	
	var steps: [Content] {
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

struct TupleDeck9<V1: Deck, V2: Deck, V3: Deck, V4: Deck, V5: Deck, V6: Deck, V7: Deck, V8: Deck, V9: Deck>: Deck {
	typealias Content = AnyView
	
	var contents: (V1, V2, V3, V4, V5, V6, V7, V8, V9)
	
	var steps: [Content] {
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
