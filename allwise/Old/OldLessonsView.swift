//
//  LessonsView.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

struct LessonsView: View {
    
    @ObservedObject var allLessons: AllLessonsViewModel
    @State private var selectedLessonID: UUID?
    @State private var navToTopicsView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(allLessons.lessons, id: \.id) { lesson in
                    LessonSelectionButton(
                        title: lesson.name,
                        image: lesson.image,
                        isSelected: Binding(
                            get: { selectedLessonID == lesson.id },
                            set: { isSelected in
                                if isSelected {
                                    selectedLessonID = lesson.id
                                }
                            }
                        ),
                        action: {
                            selectedLessonID = lesson.id
                        }
                    )
                }
                ContinueButton(action: {
                    if selectedLessonID != nil {
                        navToTopicsView = true
                    }
                })
                .disabled(selectedLessonID == nil)
            }
            .navigationDestination(isPresented: $navToTopicsView) {
                if let lessonID = selectedLessonID,
                   let topics = allLessons.topics(for: lessonID) {
                    TopicsView(allLessons: allLessons, topics: topics, lessonID: lessonID)
                }
            }
        }
    }
}

#Preview {
    LessonsView(allLessons: AllLessonsViewModel())
}
