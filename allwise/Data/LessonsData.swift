//
//  LessonsData.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import Foundation

let mockDataForSubTopicView = [
    Lesson(name: "L1", image: "📘", topics: (1...10).map { topicIndex in
        Topic(name: "L1 T\(topicIndex)", subtopics: (1...5).map { subTopicIndex in
            SubTopic(name: "L1 T\(topicIndex) ST\(subTopicIndex)", questions: [], isSolved: false)
        }, isSolved: false)
    }),
    Lesson(name: "L2", image: "📗", topics: (1...10).map { topicIndex in
        Topic(name: "L2 T\(topicIndex)", subtopics: (1...5).map { subTopicIndex in
            SubTopic(name: "L2 T\(topicIndex) ST\(subTopicIndex)", questions: [], isSolved: false)
        }, isSolved: false)
    }),
    Lesson(name: "L3", image: "📙", topics: (1...10).map { topicIndex in
        Topic(name: "L3 T\(topicIndex)", subtopics: (1...5).map { subTopicIndex in
            SubTopic(name: "L3 T\(topicIndex) ST\(subTopicIndex)", questions: [], isSolved: false)
        }, isSolved: false)
    })
    // Add more lessons as needed
]


let mockData = [
    Lesson(
        name: "Science",
        image: "🔬",
        topics: [
            Topic(
                name: "Biology",
                subtopics: [
                    SubTopic(
                        name: "Cell Biology",
                        questions: [
                            Question(
                                question: "What is the powerhouse of the cell?",
                                explanation: "The mitochondria is known as the powerhouse of the cell because it generates most of the cell's supply of adenosine triphosphate (ATP), used as a source of chemical energy.",
                                answers: [
                                    Answer(text: "Mitochondria", isTrue: true),
                                    Answer(text: "Nucleus", isTrue: false),
                                    Answer(text: "Ribosome", isTrue: false),
                                    Answer(text: "Endoplasmic Reticulum", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            ),
                            // Add more questions here if needed
                        ],
                        isSolved: false
                    ),
                    // Add more subtopics if needed
                ],
                isSolved: false
            ),
            Topic(
                name: "Physics",
                subtopics: [
                    SubTopic(
                        name: "Classical Mechanics",
                        questions: [
                            Question(
                                question: "What is Newton's first law?",
                                explanation: "Newton's first law states that every object will remain at rest or in uniform motion in a straight line unless compelled to change its state by the action of an external force.",
                                answers: [
                                    Answer(text: "Law of Inertia", isTrue: true),
                                    Answer(text: "Law of Acceleration", isTrue: false),
                                    Answer(text: "Law of Interaction", isTrue: false),
                                    Answer(text: "Law of Gravitation", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            ),
                            // Add more questions here if needed
                        ],
                        isSolved: false
                    ),
                    // Add more subtopics if needed
                ],
                isSolved: false
            ),
            Topic(
                name: "Chemistry",
                subtopics: [
                    SubTopic(
                        name: "Organic Chemistry",
                        questions: [
                            Question(
                                question: "What is the main element in organic compounds?",
                                explanation: "Carbon is the main element in organic compounds, primarily due to its ability to form stable bonds with many elements, including itself.",
                                answers: [
                                    Answer(text: "Carbon", isTrue: true),
                                    Answer(text: "Hydrogen", isTrue: false),
                                    Answer(text: "Oxygen", isTrue: false),
                                    Answer(text: "Nitrogen", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            ),
                            // Add more questions here if needed
                        ],
                        isSolved: false
                    ),
                    // Add more subtopics if needed
                ],
                isSolved: false
            )
            // Add more topics if needed
        ]
    ),
    
    Lesson(
        name: "History",
        image: "🏛️",
        topics: [
            Topic(
                name: "Ancient Civilizations",
                subtopics: [
                    SubTopic(
                        name: "Egyptian Pharaohs",
                        questions: [
                            Question(
                                question: "Who was the first female pharaoh of Egypt?",
                                explanation: "Hatshepsut was the first female pharaoh of Egypt, known for her prosperous reign.",
                                answers: [
                                    Answer(text: "Hatshepsut", isTrue: true),
                                    Answer(text: "Nefertiti", isTrue: false),
                                    Answer(text: "Cleopatra", isTrue: false),
                                    Answer(text: "Neithhotep", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            ),
                            Question(
                                question: "Which pharaoh's tomb was discovered almost intact in the Valley of the Kings?",
                                explanation: "Tutankhamun's tomb was discovered almost intact in 1922 by Howard Carter.",
                                answers: [
                                    Answer(text: "Tutankhamun", isTrue: true),
                                    Answer(text: "Khufu", isTrue: false),
                                    Answer(text: "Ramses II", isTrue: false),
                                    Answer(text: "Amenhotep III", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            )
                        ],
                        isSolved: false
                    ),
                    SubTopic(
                        name: "Egyptian Pharaon 2",
                        questions: [
                            Question(
                                question: "Who was the first female pharaoh of Egypt? 2",
                                explanation: "Hatshepsut was the first female pharaoh of Egypt, known for her prosperous reign. 2222",
                                answers: [
                                    Answer(text: "Hatshepsut 222", isTrue: true),
                                    Answer(text: "Nefertiti 222", isTrue: false),
                                    Answer(text: "Cleopatra 222", isTrue: false),
                                    Answer(text: "Neithhotep 222", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            ),
                            Question(
                                question: "Which pharaoh's tomb was discovered almost intact in the Valley of the Kings? 222",
                                explanation: "Tutankhamun's tomb was discovered almost intact in 1922 by Howard Carter.222",
                                answers: [
                                    Answer(text: "Tutankhamun222", isTrue: true),
                                    Answer(text: "Khufu222", isTrue: false),
                                    Answer(text: "Ramses II222", isTrue: false),
                                    Answer(text: "Amenhotep III222", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            )
                        ],
                        isSolved: false
                    )
                ],
                isSolved: false
            ),
            Topic(
                name: "Medieval Europe",
                subtopics: [
                    SubTopic(
                        name: "SubTopic1",
                        questions: [
                            Question(
                                question: "What was the primary duty of a medieval knight?",
                                explanation: "A medieval knight's primary duty was to serve their lord in battle.",
                                answers: [
                                    Answer(text: "Serve in battle", isTrue: true),
                                    Answer(text: "Farm the land", isTrue: false),
                                    Answer(text: "Rule the kingdom", isTrue: false),
                                    Answer(text: "Collect taxes", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            ),
                            Question(
                                question: "Which event led to the decline of feudalism in Europe?",
                                explanation: "The Black Death, along with other social and economic factors, led to the decline of feudalism in Europe.",
                                answers: [
                                    Answer(text: "The signing of the Magna Carta", isTrue: false),
                                    Answer(text: "The Hundred Years' War", isTrue: false),
                                    Answer(text: "The Black Death", isTrue: true),
                                    Answer(text: "The Crusades", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            )
                        ],
                        isSolved: false
                    ),
                    SubTopic(
                        name: "Subtopic2",
                        questions: [
                            Question(
                                question: "What was the primary duty of a medieval knight?",
                                explanation: "A medieval knight's primary duty was to serve their lord in battle.",
                                answers: [
                                    Answer(text: "Serve in battle", isTrue: true),
                                    Answer(text: "Farm the land", isTrue: false),
                                    Answer(text: "Rule the kingdom", isTrue: false),
                                    Answer(text: "Collect taxes", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            ),
                            Question(
                                question: "Which event led to the decline of feudalism in Europe?",
                                explanation: "The Black Death, along with other social and economic factors, led to the decline of feudalism in Europe.",
                                answers: [
                                    Answer(text: "The signing of the Magna Carta", isTrue: false),
                                    Answer(text: "The Hundred Years' War", isTrue: false),
                                    Answer(text: "The Black Death", isTrue: true),
                                    Answer(text: "The Crusades", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            )
                        ],
                        isSolved: false
                    )
                ],
                isSolved: false
            )
        ]
    ),
    Lesson(
        name: "Geography",
        image: "🌍",
        topics: [
            Topic(
                name: "Physical Geography",
                subtopics: [
                    SubTopic(
                        name: "Mountain Ranges",
                        questions: [
                            Question(
                                question: "Which mountain range includes Mount Everest?",
                                explanation: "Mount Everest is part of the Himalayas, which stretch across five countries in Asia.",
                                answers: [
                                    Answer(text: "The Himalayas", isTrue: true),
                                    Answer(text: "The Rockies", isTrue: false),
                                    Answer(text: "The Andes", isTrue: false),
                                    Answer(text: "The Alps", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            ),
                            Question(
                                question: "What is the longest mountain range in the world?",
                                explanation: "The Andes is the longest continental mountain range in the world, located in South America.",
                                answers: [
                                    Answer(text: "The Rockies", isTrue: false),
                                    Answer(text: "The Andes", isTrue: true),
                                    Answer(text: "The Himalayas", isTrue: false),
                                    Answer(text: "The Great Dividing Range", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            )
                        ],
                        isSolved: false
                    )
                ],
                isSolved: false
            ),
            Topic(
                name: "Cultural Geography",
                subtopics: [
                    SubTopic(
                        name: "World Languages",
                        questions: [
                            Question(
                                question: "Which language is the most widely spoken in the world?",
                                explanation: "Mandarin Chinese is the most widely spoken language in the world by the number of native speakers.",
                                answers: [
                                    Answer(text: "English", isTrue: false),
                                    Answer(text: "Spanish", isTrue: false),
                                    Answer(text: "Mandarin Chinese", isTrue: true),
                                    Answer(text: "Hindi", isTrue: false)
                                ],
                                isSolved: false,
                                type: .duo
                            ),
                            Question(
                                question: "What is the most widely practiced religion in the world?",
                                explanation: "Christianity is the most widely practiced religion in the world.",
                                answers: [
                                    Answer(text: "Christianity", isTrue: true),
                                    Answer(text: "Islam", isTrue: false),
                                    Answer(text: "Hinduism", isTrue: false),
                                    Answer(text: "Buddhism", isTrue: false)
                                ],
                                isSolved: false,
                                type: .choice
                            )
                        ],
                        isSolved: false
                    )
                ],
                isSolved: false
            )
        ]
    )
]
