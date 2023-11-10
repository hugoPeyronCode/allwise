//
//  LessonsView2.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import SwiftUI
import SwiftUI

struct LessonsSelectionModalView: View {
    
    let lessons: [Lesson]
    @Environment(\.dismiss) var dismiss
    @Binding var selectedLessonID: UUID?
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(lessons, id: \.id) { lesson in
                    Button(action: {
                        self.selectedLessonID = lesson.id
                        dismiss()
                    }) {
                        VStack(spacing: 10) {
                            Text(lesson.image)
                                .font(.largeTitle)
                            Text(lesson.name)
                                .bold()
                                .font(.subheadline)
                                .foregroundStyle(.foreground)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lesson.id == selectedLessonID ? Color.mint : Color.clear, lineWidth: 3)
                        )
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    LessonsSelectionModalView(lessons: AllLessonsViewModel().lessons, selectedLessonID: .constant(UUID()))
}
