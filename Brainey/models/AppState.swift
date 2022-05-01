//
//  AppState.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-05-01.
//

import SwiftUI

final class AppState: ObservableObject {
    @Published var rootViewId = UUID()
}
