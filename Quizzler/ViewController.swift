import UIKit

class ViewController: UIViewController {
    //properties
    let allQuestions = QuestionBank()
  
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {pickedAnswer = true}
        else if sender.tag == 2 {pickedAnswer = false}
        
        checkAnswer()

        //increment question
        questionNumber += 1

        nextQuestion()
    }
    
    func updateUI() {
    scoreLabel.text = "\(score)"
    progressLabel.text = "\(questionNumber + 1)"
    progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
             let alert = UIAlertController(title: "Hello", message: "you answered all the question's", preferredStyle: .alert)
            let alertTapped = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(alertTapped)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            print("i got it")
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else{
            print("im wrong")
            ProgressHUD.showError("Wrong!")

        }
    }
    
    func startOver() {
       questionNumber = 0
        nextQuestion()
        score = 0
    }
    
}
