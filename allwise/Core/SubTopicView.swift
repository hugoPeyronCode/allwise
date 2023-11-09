//
//  QuestionsView.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

struct SubTopicView: View {
    
    let subTopic : SubTopic
    
    var body: some View {
        List(subTopic.questions, id: \.id) { question in
            NavigationLink(question.question) {
                QuestionView(question : question)
            }
        }
    }
}

//#Preview {
////    
////    let lessons = LessonsManager.shared.allLessons
////    let questions = lessons.map { Lesson in
////        lesson.topics.map { topic in
////            topic.questions
////        }
////    }
//    
//    QuestionsView(topic: LessonsManager.shared.allLessons.topics.randomElement()!)
//}
