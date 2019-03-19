//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

public class ViewController : UIViewController {
    
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
    public let progressView = ProgressCircularView(frame: CGRect(x: 575, y: 80, width: 50, height: 50))
    
    
    public let questionList = QuestionBank()
    
    public override func loadView() {
        let view = UIView()
        //print(self.view.frame)
        
        background.image = UIImage(named: "bg2.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 2.0/255, green: 156.0/255, blue: 124.0/255, alpha: 1.0)
        view.addSubview(progressView)
        
        lblQuestionNumber.frame = CGRect(x: 20, y: 120, width: 200, height: 30)
        lblQuestionNumber.font = lblQuestionNumber.font.withSize(25)
        lblQuestionNumber.textColor = UIColor(red: 2.0/255, green: 156.0/255, blue: 124.0/255, alpha: 1.0)
        
        view.addSubview(lblQuestionNumber)
        
        
        imageView.frame = CGRect(x: 300, y: 360, width: 125, height: 150)
        view.addSubview(imageView)
        
        
        questionText.frame = CGRect(x: 100, y: 500, width: 525, height: 175)
        questionText.textAlignment = .center
        questionText.numberOfLines = 6
        questionText.adjustsFontSizeToFitWidth = true
        questionText.font = questionText.font.withSize(40)
        questionText.textColor = .black
        view.addSubview(questionText)
        
        
        optionA.frame = CGRect(x: 100, y: 700, width: 250, height: 100)
        optionA.tag = 0
        optionA.backgroundColor = UIColor.lightGray
        optionA.layer.cornerRadius = 12
        optionA.layer.borderWidth = 2
        optionA.layer.borderColor = UIColor.black.cgColor
        
        optionA.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionA)
        
        
        optionB.frame = CGRect(x: 375, y: 700, width: 250, height: 100)
        optionB.tag = 1
        optionB.backgroundColor = UIColor.lightGray
        optionB.layer.cornerRadius = 12
        optionB.layer.borderWidth = 2
        optionB.layer.borderColor = UIColor.black.cgColor
        
        optionB.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionB)
        
        
        optionC.frame = CGRect(x: 100, y: 825, width: 250, height: 100)
        optionC.tag = 2
        optionC.backgroundColor = UIColor.lightGray
        optionC.layer.cornerRadius = 12
        optionC.layer.borderWidth = 2
        optionC.layer.borderColor = UIColor.black.cgColor
        
        optionC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionC)
        
        
        optionD.frame = CGRect(x: 375, y: 825, width: 250, height: 100)
        optionD.tag = 3
        optionD.backgroundColor = UIColor.lightGray
        optionD.layer.cornerRadius = 12
        optionD.layer.borderWidth = 2
        optionD.layer.borderColor = UIColor.black.cgColor;
        
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
            optionA.setTitleColor(UIColor.darkGray, for: .highlighted)
            
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
            let finishQuizzViewController = FinishQuizzViewController()
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
