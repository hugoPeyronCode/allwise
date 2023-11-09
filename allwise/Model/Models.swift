//
//  Modelzs.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import Foundation

enum QuestionType {
    case duo
    case choice
    case cash
}

struct Answer: Identifiable {
    let id = UUID()
    let text: String
    let isTrue: Bool
}

struct Question: Identifiable {
    let id = UUID()
    let question: String
    let explanation: String
    let answers: [Answer]
    var isSolved: Bool
    let type: QuestionType
}

struct SubTopic: Identifiable {
    let id = UUID()
    let name: String
    var questions: [Question]
    var isSolved: Bool
}

struct Topic: Identifiable {
    let id = UUID()
    let name: String
    var subtopics: [SubTopic]
    var isSolved: Bool
}

struct Lesson: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    var topics: [Topic]
}
