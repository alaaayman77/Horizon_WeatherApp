//
//  TabBarButton.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI
struct TabBarButton: View {
    var icon: String
    var title: String
    var tab: TabKey
    @Binding var selection: TabKey
    
    var body: some View {
        Button(action: {
            selection = tab
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.caption2)
            }
        
            .foregroundColor(selection == tab ? .blue : .gray)
        }
    }
}
