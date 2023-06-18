//
//  QuizQuestionsViewModel.swift
//  Skylab
//
//  Created by Aleksey Kotsevych on 17/06/2023.
//

import Foundation

class QuizQuestionsViewModel: QuizQuestionsViewModelProtocol {
    
    var quizData: QuizTopicsModel?

    var quiz: [QuizQuestionsModel] = [QuizQuestionsModel(question: "Which class is used to represent a button in UIKit?", answer: ["UILabel", "UIButton", "UITextField", "UIImageView"], correctAnswer: "b)"),
                                      QuizQuestionsModel(question: "What is the purpose of Auto Layout in UIKit?", answer: ["To handle network requests and data parsing", "To manage user input and interactions", "To define flexible and adaptive layouts for views", "To manage app navigation and transitions"], correctAnswer: "c)"),
                                      QuizQuestionsModel(question: "How can you change the text color of a label in UIKit?", answer: ["Using the backgroundColor property of UIView", " Using the textColor property of UILabel", "Using the image property of UIImageView", "Using the setTitleTextAttributes method of UIBarButtonItem"], correctAnswer: "b)"),
                                      
                                      QuizQuestionsModel(question: "Which class is responsible for handling user input and touch events in UIKit?", answer: ["UISlider", "UITextField", "UIResponder", "UIViewController"], correctAnswer: "c)"),
                                      
                                      QuizQuestionsModel(question: "What is the purpose of the UINavigationController class in UIKit?", answer: ["To present modal views or view controllers", "To display hierarchical navigation interfaces", " To manage table views and their data sources", "To handle animations and transitions between views"], correctAnswer: "b)"),
                                      
                                      QuizQuestionsModel(question: "Which class is used to handle user input and touch events in UIKit?", answer: ["UIGestureRecognizer", "UIControl", "UIResponder", "UIViewController"], correctAnswer: "c)"),
                                      
                                      QuizQuestionsModel(question: "Which class is used to display and manage tabbed interfaces in UIKit?", answer: ["UITabBarController", "UINavigationController", "UITabBar", "UIPageViewController"], correctAnswer: "a)"),
                                      
                                      QuizQuestionsModel(question: "What is the purpose of the UIActivityIndicatorView class in UIKit?", answer: ["To display progress bars and loading indicators", "To handle user authentication and authorization", "To manage navigation and transitions between screens", "To present alerts and action sheets"], correctAnswer: "a)"),
    ]
    
    var questionNumber = 0
    var quizScore = 0
    
    func getQuestionText() -> String {
        
        quiz[questionNumber].question
    }
    
    func nextQuestion() {
        
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getAnswers() -> [String] {
        
        quiz[questionNumber].answer
    }
    
    func checkCorrectAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].correctAnswer {
            return true
        } else {
            return false
        }
    }
    
}
