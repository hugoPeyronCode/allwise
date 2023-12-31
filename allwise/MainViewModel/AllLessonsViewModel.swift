//
//  MockData.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import Foundation

class AllLessonsViewModel: ObservableObject {
    
    @Published var nextPlayableTopicIndex: Int?
    @Published var selectedSubTopic: SubTopic?

    
    // Fonction pour marquer un topic comme résolu
    func completeTopic(lessonID: UUID, topicID: UUID) {
        if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonID }),
           let topicIndex = lessons[lessonIndex].topics.firstIndex(where: { $0.id == topicID }) {
            lessons[lessonIndex].topics[topicIndex].isSolved = true
        }
    }

    // Fonction pour obtenir l'index du prochain sujet jouable
    func nextPlayableTopicIndex(lessonID: UUID) -> Int? {
        if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonID }) {
            let topics = lessons[lessonIndex].topics
            return topics.firstIndex(where: { !$0.isSolved })
        }
        return nil
    }
    
    // Fonction pour obtenir les topics d'une leçon
    func topics(for lessonID: UUID) -> [Topic]? {
        return lessons.first { $0.id == lessonID }?.topics
    }
    
    
    // Function to select a subtopic for a given topic index
    func selectSubTopic(for topicIndex: Int, in lessonID: UUID) {
        if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonID }),
           let topic = lessons[lessonIndex].topics[safe: topicIndex],
           let subTopic = topic.subtopics.first(where: { !$0.isSolved }) {
            selectedSubTopic = subTopic
        }
    }
    
    // Method to mark a subtopic as solved
    func completeSubTopic(lessonID: UUID, subTopicID: UUID) {
        // Find the index of the lesson and topic that contains the subtopic
        if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonID }),
           let topicIndex = lessons[lessonIndex].topics.firstIndex(where: { topic in
               topic.subtopics.contains(where: { $0.id == subTopicID })
           }),
           let subTopicIndex = lessons[lessonIndex].topics[topicIndex].subtopics.firstIndex(where: { $0.id == subTopicID }) {
            
            // Mark the subtopic as solved
            lessons[lessonIndex].topics[topicIndex].subtopics[subTopicIndex].isSolved = true
            
            // If needed, update the next playable topic index
            updateNextPlayableTopicIndex(lessonID: lessonID)
            
            self.objectWillChange.send()
        }
    }
    
    // Optional: If you need to update which topic is next playable after completing a subtopic
    func updateNextPlayableTopicIndex(lessonID: UUID) {
        if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonID }) {
            nextPlayableTopicIndex = lessons[lessonIndex].topics.firstIndex(where: { !$0.isSolved })
        }
    }
    
    // Add a method to find a lesson by its ID
    func findLesson(by id: UUID) -> Lesson? {
        lessons.first { $0.id == id }
    }
    
    // Data provisoires
    @Published var lessons: [Lesson] = mockDataForSubTopicView
}


extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
