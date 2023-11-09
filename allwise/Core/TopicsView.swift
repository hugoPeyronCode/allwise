//
//  TopicsView.swift
//  allwise
//
//  Created by Hugo Peyron on 08/11/2023.
//

import SwiftUI

struct TopicsView: View {
    @ObservedObject var allLessons: AllLessonsViewModel
    var topics: [Topic]
    var lessonID: UUID
    @State private var isShowingSubTopicView = false
    @State private var selectedTopicIndex: Int? = nil
    @State private var selectedSubTopic: SubTopic?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(topics.indices, id: \.self) { index in
                    TopicButton(
                        allLessons: allLessons,
                        topic: topics[index],
                        index: index,
                        lessonID: lessonID,
                        selectedTopicIndex: $selectedTopicIndex,
                        isShowingSubTopicView: $isShowingSubTopicView
                    )
                }
            }
            .frame(maxWidth:.infinity)
        }
        .fullScreenCover(isPresented: $isShowingSubTopicView) {
            if let subTopic = allLessons.selectedSubTopic {
                SubTopicView(allLessons: allLessons, subTopic: subTopic, lessonID: lessonID, topicID: subTopic.id)
            } else {
                Text("No subtopic selected")
            }
        }
        .onAppear {
            selectedTopicIndex = findNextPlayableTopicIndex()
        }
    }
    
    var TopicButtonList : some View {
        ForEach(topics.indices, id: \.self) { index in
            let topic = topics[index]
            let progress = Double(topic.subtopics.filter({ $0.isSolved }).count) / Double(topic.subtopics.count)
            let isTopicSolved = topic.subtopics.allSatisfy({ $0.isSolved })

            // Topic Button
            ZStack {
                Button(action: {
                    print("Topic button tapped")
                    selectedTopicIndex = index
                    if let subTopic = firstUnsolvedSubTopic(at: index) {
                        print("Selected subtopic: \(subTopic.name)")
                        // Immediately capture the subTopic for the sheet
                        let subTopicView = SubTopicView(allLessons: allLessons, subTopic: subTopic, lessonID: lessonID, topicID: subTopic.id)
                        // Set up the sheet content directly with the captured state
                        let sheetView = AnyView(subTopicView)
                        // Present the sheet now with the direct content
                        presentSheet(with: sheetView)
                    } else {
                        print("No unsolved subtopics found for topic index: \(index)")
                    }
                }) {
                    Text(topic.name)
                        .padding()
                        .background(isTopicSolved ? Color.green : (index == selectedTopicIndex ? Color.blue : Color.gray))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                .disabled(isTopicSolved || index != selectedTopicIndex)
                
                CircularProgressView(progress: progress, color: .mint, fontSize: .callout, lineWidth: 3, withText: false)
                    .frame(height: 90)
            }
        }
    }
    
    
    // A method to handle sheet presentation with a captured view
    private func presentSheet(with view: AnyView) {
        let hostingController = UIHostingController(rootView: view)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(hostingController, animated: true, completion: nil)
        }
    }

    private func firstUnsolvedSubTopic(at index: Int) -> SubTopic? {
        let unsolvedSubTopics = topics[index].subtopics.filter { !$0.isSolved }
        return unsolvedSubTopics.first
    }

    private func findNextPlayableTopicIndex() -> Int? {
        let solvedTopicsCount = topics.prefix(while: { $0.subtopics.allSatisfy({ $0.isSolved }) }).count
        if solvedTopicsCount < topics.count {
            return solvedTopicsCount // The next topic after all solved topics
        }
        return nil // All topics are solved
    }
}

#Preview {
    TopicsView(allLessons: AllLessonsViewModel(), topics: [
        Topic(name: "1", subtopics: [SubTopic(name: "Subtopic 1-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "2", subtopics: [SubTopic(name: "Subtopic 2-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "3", subtopics: [SubTopic(name: "Subtopic 3-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "4", subtopics: [SubTopic(name: "Subtopic 4-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "5", subtopics: [SubTopic(name: "Subtopic 5-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "6", subtopics: [SubTopic(name: "Subtopic 6-1", questions: [], isSolved: false)], isSolved: false),
        Topic(name: "7", subtopics: [SubTopic(name: "Subtopic 7-1", questions: [], isSolved: false)], isSolved: false)
    ], lessonID: UUID())
}
