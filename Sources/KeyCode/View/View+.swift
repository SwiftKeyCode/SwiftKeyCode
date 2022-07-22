//
//  View+.swift
//  
//
//  Created by Lukas Tenbrink on 22.07.22.
//

import SwiftUI

extension View {
	  public func eraseToAnyView() -> AnyView {
		  AnyView(self)
	  }
}
