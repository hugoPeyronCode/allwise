//
//  HomeView.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var allLessons: AllLessonsViewModel
    
    @State private var selectedLessonID: UUID? = nil
    @State private var isShowingLessonsSelectionView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if let lessonID = selectedLessonID,
                   let topics = allLessons.topics(for: lessonID) {
                    TopicsView(allLessons: allLessons, topics: topics, lessonID: lessonID)
                }
            }
            .sheet(isPresented: $isShowingLessonsSelectionView) {
                LessonsSelectionModalView(lessons: allLessons.lessons, selectedLessonID: $selectedLessonID)
            }
            .onAppear {
                if selectedLessonID == nil, let firstLessonID = allLessons.lessons.first?.id {
                    selectedLessonID = firstLessonID
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isShowingLessonsSelectionView.toggle()
                    }) {
                        // Display the selected lesson's emoji or a default one
                        Text(allLessons.findLesson(by: selectedLessonID ?? UUID())?.image ?? "🏫")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(allLessons: AllLessonsViewModel())
}
