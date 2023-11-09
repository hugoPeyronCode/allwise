//
//  QuestionsView.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

struct SubTopicView: View {
    @ObservedObject var allLessons: AllLessonsViewModel
    var subTopic: SubTopic
    var lessonID: UUID
    var topicID: UUID
    
    @Environment(\.dismiss) var dismiss  // Use the environment dismiss action

    var body: some View {
        VStack {
            
            Text(subTopic.name)
            
            ForEach(subTopic.questions, id: \.id) { question in
                Text(question.question)
            }
            Button("Complete SubTopic", action: {
                allLessons.completeSubTopic(lessonID: lessonID, subTopicID: subTopic.id)
                dismiss()
            })
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


#Preview {
    SubTopicView(allLessons: AllLessonsViewModel(), subTopic: SubTopic(name: "Test", questions: [], isSolved: false), lessonID: UUID(), topicID: UUID())
}
