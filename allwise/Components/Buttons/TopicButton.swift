//
//  TopicButton.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

struct TopicButton: View {
    @ObservedObject var allLessons: AllLessonsViewModel
    let topic: Topic
    let index: Int
    let lessonID: UUID 
    @Binding var selectedTopicIndex: Int?
    @Binding var isShowingSubTopicView: Bool
    
    var body: some View {
        let progress = Double(topic.subtopics.filter({ $0.isSolved }).count) / Double(topic.subtopics.count)
        let isTopicSolved = topic.subtopics.allSatisfy({ $0.isSolved })

        ZStack {
            Button(action: {
                print("Topic button tapped")
                selectedTopicIndex = index
                allLessons.selectSubTopic(for: index, in: lessonID) // Pass the lesson ID as well
                isShowingSubTopicView = true
            }) {
                VStack{
                Image(systemName: isTopicSolved ? "checkmark" : (index == selectedTopicIndex ? "star.fill" : "star"))
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isTopicSolved ? .white : (index == selectedTopicIndex ? .blue : .black))
                        .opacity(0.5)
                        .fontWeight(.black)
                        .padding()
                Text(topic.name)
                    .foregroundStyle(.foreground)
                }
                .frame(width: 120, height: 120)
                .padding()
                .background(isTopicSolved ? Color.green.opacity(0.8) : (index == selectedTopicIndex ? Color.cyan : Color.gray))
                .clipShape(Circle())
            }
            .disabled(isTopicSolved || index != selectedTopicIndex)
            
            CircularProgressView(progress: progress, color: isTopicSolved ? Color.green : (index == selectedTopicIndex ? Color.blue : Color.gray), fontSize: .callout, lineWidth: 10, withText: false)
                .frame(width: 180)
        }
    }
}

