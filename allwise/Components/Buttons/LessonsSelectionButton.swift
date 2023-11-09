//
//  LessonsSelectionButton.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import SwiftUI

struct LessonSelectionButton: View {
    let title: String
    let image: String
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(image)
                Text(title)
                    .foregroundColor(isSelected ? .blue : .primary)
            }
            .padding()
            .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
            .cornerRadius(8)
        }
    }
}


#Preview {
    LessonSelectionButton(title: "History", image: "📜", isSelected: .constant(true), action: {})
}
