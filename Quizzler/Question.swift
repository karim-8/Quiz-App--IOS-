
import Foundation

class Question {
    
    var questionText: String
    var answer: Bool
    
    //creating initializer to set values without identifying particullar value
    //also when a new obj created inside the class
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
