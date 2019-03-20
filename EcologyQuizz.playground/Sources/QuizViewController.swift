//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

public class QuizViewController : UIViewController {
    
    public let allQuestions = QuestionBank()
    public var questionNumber: Int = 0
    public var progress : Float = 0
    public let background = UIImageView()
    public let optionA = UIButton()
    public let optionB = UIButton()
    public let optionC = UIButton()
    public let optionD = UIButton()
    public let imageView = UIImageView()
    public let questionText = UILabel()
    public let lblQuestionNumber = UILabel()
    public let questionView = UIView()
    public let progressView = ProgressCircularView(frame: CGRect(x: 560, y: 80, width: 50, height: 50))
    
    
    public let questionList = QuestionBank()
    
    public override func loadView() {
        let view = UIView()
        //print(self.view.frame)
        
        background.image = UIImage(named: "bg3.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)
        view.addSubview(progressView)
        
        lblQuestionNumber.frame = CGRect(x: 20, y: 120, width: 200, height: 30)
        //lblQuestionNumber.font = lblQuestionNumber.font.withSize(25)
        lblQuestionNumber.textColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)
        view.addSubview(lblQuestionNumber)
        lblQuestionNumber.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        imageView.frame = CGRect(x: 300, y: 330, width: 125, height: 150)
        view.addSubview(imageView)
        
        
        questionText.frame = CGRect(x: 100, y: 470, width: 525, height: 175)
        questionText.textAlignment = .center
        questionText.numberOfLines = 6
        questionText.adjustsFontSizeToFitWidth = true
        questionText.font = questionText.font.withSize(40)
        questionText.textColor = .black
        view.addSubview(questionText)
        
        
        optionA.frame = CGRect(x: 100, y: 710, width: 260, height: 110)
        optionA.tag = 0
        optionA.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
        optionA.layer.cornerRadius = 12
        optionA.layer.borderWidth = 2
        optionA.layer.borderColor = UIColor.black.cgColor
        optionA.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        optionA.titleLabel?.adjustsFontSizeToFitWidth = true
        optionA.titleLabel?.numberOfLines = 2
        
        optionA.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionA)
        
        
        optionB.frame = CGRect(x: 375, y: 710, width: 260, height: 110)
        optionB.tag = 1
        optionB.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
        optionB.layer.cornerRadius = 12
        optionB.layer.borderWidth = 2
        optionB.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        optionB.layer.borderColor = UIColor.black.cgColor
       // optionB.titleLabel?.font = optionA.titleLabel?.font.withSize(25)
        optionB.titleLabel?.adjustsFontSizeToFitWidth = true
        optionB.titleLabel?.numberOfLines = 2
        
        optionB.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionB)
        
        
        optionC.frame = CGRect(x: 100, y: 835, width: 260, height: 110)
        optionC.tag = 2
        optionC.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
        optionC.layer.cornerRadius = 12
        optionC.layer.borderWidth = 2
        optionC.layer.borderColor = UIColor.black.cgColor
        optionC.titleLabel?.font = optionA.titleLabel?.font.withSize(25)
        optionC.titleLabel?.adjustsFontSizeToFitWidth = true
        optionC.titleLabel?.numberOfLines = 2
        
        optionC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionC)
        
        
        optionD.frame = CGRect(x: 375, y: 835, width: 260, height: 110)
        optionD.tag = 3
        optionD.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
        optionD.layer.cornerRadius = 12
        optionD.layer.borderWidth = 2
        optionD.layer.borderColor = UIColor.black.cgColor
        optionD.titleLabel?.font = optionA.titleLabel?.font.withSize(25)
        optionD.titleLabel?.adjustsFontSizeToFitWidth = true
        optionD.titleLabel?.numberOfLines = 2
        
        optionD.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionD)
        updateQuestion()
        
        self.view = view
    }
    
    @objc func buttonTapped(sender: UIButton) {
        //print("Button was tapped \(String(describing: sender.titleLabel?.text))")
        var auxProgressValue: Float = progress
        if sender.tag == 0 {
            auxProgressValue += allQuestions.list[questionNumber].optionA.value
        }
        if sender.tag == 1 {
            auxProgressValue += allQuestions.list[questionNumber].optionB.value
        }
        if sender.tag == 2 {
            auxProgressValue += allQuestions.list[questionNumber].optionC.value
        }
        else {
            auxProgressValue += allQuestions.list[questionNumber].optionD.value
        }
        
        progressView.setProgressWithAnimation(duration: 1, fromValue: progress, value: auxProgressValue)
        progress = auxProgressValue
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            imageView.image = UIImage(named:(questionList.list[questionNumber].image))
            questionText.text = allQuestions.list[questionNumber].questionText
            
            
            optionA.setTitle(questionList.list[questionNumber].optionA.choice, for: .normal)
            optionA.setTitleColor(.black, for: .normal)
            
            optionB.setTitle(questionList.list[questionNumber].optionB.choice, for: .normal)
            optionB.setTitleColor(.black, for: .normal)
            
            optionC.setTitle(questionList.list[questionNumber].optionC.choice , for: .normal)
            optionC.setTitleColor(.black, for: .normal)
            
            
            optionD.setTitle(questionList.list[questionNumber].optionD.choice, for: .normal)
            optionD.setTitleColor(.black, for: .normal)
            
            
            updateUI()
            
        }else {
//            let alert = UIAlertController(title: "Awesome!!!" , message: "You are \(progress*100)% conscious about it ", preferredStyle: .alert)
//            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
//            alert.addAction(restartAction)
//            present(alert, animated: true, completion: nil)
            let finishQuizzViewController = FinishScreenViewController()
            finishQuizzViewController.progress = self.progress
            self.present(finishQuizzViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
    func updateUI(){
        lblQuestionNumber.text = "Question: \(questionNumber+1)/\(allQuestions.list.count)"
    }
    
    func restartQuiz(){
        questionNumber = 0
        updateQuestion()
        progress = 0
        progressView.setProgressWithAnimation(duration: 0, fromValue: progress, value: 0)
    }
    
    
}
