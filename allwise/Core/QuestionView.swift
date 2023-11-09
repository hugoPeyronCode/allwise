//
//  QuestionView.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.


import SwiftUI

struct QuestionView: View {
    
    let question : Question
    
    var body: some View {
        VStack {
            Text(question.question)
            ForEach(question.answers, id: \.id) { answer in
                Text(answer.text)
            }
            Text(question.explanation)
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    QuestionView(question: Question(question: "Combien font deux et deux", explanation: "4", answers: [Answer(text: "1", isTrue: false), Answer(text: "2", isTrue: false), Answer(text: "3", isTrue: false), Answer(text: "4", isTrue: true)], isSolved: false, type: .duo))
}
