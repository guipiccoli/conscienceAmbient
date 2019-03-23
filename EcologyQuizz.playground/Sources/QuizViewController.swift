//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

public class QuizViewController : UIViewController {
    
    public var questionNumber: Int = 0
    public var score : Float = 0
    
    public let background = UIImageView()
    public let optionA = UIButton()
    public let optionB = UIButton()
    public let optionC = UIButton()
    public let optionD = UIButton()
    public let imageView = UIImageView()
    public let questionText = UILabel()
    public let lblQuestionNumber = UILabel()
    public let questionView = UIView()
    public let progressView = ProgressCircularView(frame: CGRect(x: 330, y: 175, width: 50, height: 50))
    
    
    public let questionList = QuestionBank()
    
    public override func loadView() {
        let view = UIView()
        
        background.image = UIImage(named: "background.png")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.frame = CGRect(x: 135, y: 60, width: 450, height: 150)
        
        view.addSubview(logo)
        
        
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)
        view.addSubview(progressView)
        
        lblQuestionNumber.frame = CGRect(x: 280, y: 210, width: 200, height: 30)
        lblQuestionNumber.font = UIFont(name: "Futura-Bold", size: 25)
        lblQuestionNumber.textColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)
        view.addSubview(lblQuestionNumber)
        
        
        imageView.frame = CGRect(x: 290, y: 300, width: 135, height: 160)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        
        questionText.frame = CGRect(x: 100, y: 450, width: 525, height: 175)
        questionText.textAlignment = .center
        questionText.numberOfLines = 6
        questionText.adjustsFontSizeToFitWidth = true
        questionText.font = UIFont(name: "Futura-Bold", size: 40)
        questionText.textColor = UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0)
        view.addSubview(questionText)
        
        
        optionA.frame = CGRect(x: 85, y: 710, width: 270, height: 130)
        optionA.tag = 100
        optionA.layer.cornerRadius = 12
        optionA.titleLabel?.textAlignment = .center
        optionA.titleLabel?.font = UIFont(name: "Futura", size: 21)
        
        optionA.titleLabel?.numberOfLines = 4
        
        optionA.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionA)
        
        
        optionB.frame = CGRect(x: 365, y: 710, width: 270, height: 130)
        optionB.tag = 101
        optionB.layer.cornerRadius = 12
        optionB.titleLabel?.textAlignment = .center
        optionB.titleLabel?.font = UIFont(name: "Futura", size: 21)
        optionB.titleLabel?.adjustsFontSizeToFitWidth = true
        optionB.titleLabel?.numberOfLines = 4
        
        optionB.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionB)
        
        
        optionC.frame = CGRect(x: 85, y: 855, width: 270, height: 130)
        optionC.tag = 102
        optionC.layer.cornerRadius = 12
        optionC.titleLabel?.textAlignment = .center
        optionC.titleLabel?.font = UIFont(name: "Futura", size: 21)
        optionC.titleLabel?.adjustsFontSizeToFitWidth = true
        optionC.titleLabel?.numberOfLines = 4
        
        optionC.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionC)
        
        
        optionD.frame = CGRect(x: 365, y: 855, width: 270, height: 130)
        optionD.tag = 103
        optionD.titleLabel?.font = UIFont(name: "Futura", size: 21)
        optionD.layer.cornerRadius = 12
        optionD.titleLabel?.textAlignment = .center
        optionD.titleLabel?.adjustsFontSizeToFitWidth = true
        optionD.titleLabel?.numberOfLines = 4
        
        optionD.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        view.addSubview(optionD)
        updateQuestion()
        
        self.view = view
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let scorePerQuestion: Float = (1.0/Float(questionList.list.count))
        var auxProgressValue: Float = score
        
        if sender.tag == questionList.list[questionNumber].answer {
            auxProgressValue += scorePerQuestion
            UIView.animate(withDuration: 0.5, animations: {
                sender.backgroundColor = UIColor.init(red: 116.0/225, green: 162.0/255, blue: 38.0/255, alpha: 0.9)
                self.optionA.isEnabled = false
                self.optionB.isEnabled = false
                self.optionC.isEnabled = false
                self.optionD.isEnabled = false
            }) { (hasEnded) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.optionA.isEnabled = true
                    self.optionB.isEnabled = true
                    self.optionC.isEnabled = true
                    self.optionD.isEnabled = true
                    self.updateQuestion()
                }
            }
        }
        //wrong answer
        else {
            UIView.animate(withDuration: 0.5, animations: {
                sender.backgroundColor = UIColor.init(red: 238.0/225, green: 78.0/255, blue: 44/255, alpha: 0.9)
                if let button = self.view.viewWithTag(self.questionList.list[self.questionNumber].answer) {
                    button.backgroundColor = UIColor.init(red: 116.0/225, green: 162.0/255, blue: 38.0/255, alpha: 0.9)
                    self.optionA.isEnabled = false
                    self.optionB.isEnabled = false
                    self.optionC.isEnabled = false
                    self.optionD.isEnabled = false
                    }
            }) { (hasEnded) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.optionA.isEnabled = true
                    self.optionB.isEnabled = true
                    self.optionC.isEnabled = true
                    self.optionD.isEnabled = true
                    self.updateQuestion()
                }
            }
        }
        
        progressView.setProgressWithAnimation(duration: 1, fromValue: score, value: auxProgressValue)
        score = auxProgressValue
        
        questionNumber += 1
        
    }
    
    func updateQuestion(){
        
        if questionNumber <= questionList.list.count - 1{
            imageView.image = UIImage(named:(questionList.list[questionNumber].image))
            questionText.text = questionList.list[questionNumber].questionText
            
            if questionList.list[questionNumber].boolImageOption {
                optionA.setTitle("", for: .normal)
                optionA.setImage(UIImage(named: questionList.list[questionNumber].optionA), for: .normal)
                optionA.imageView?.contentMode = .scaleAspectFit
                optionA.setTitleColor(.black, for: .normal)
                optionA.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                
                optionB.setTitle("", for: .normal)
                optionB.setImage(UIImage(named: questionList.list[questionNumber].optionB), for: .normal)
                optionB.imageView?.contentMode = .scaleAspectFit
                optionB.setTitleColor(.black, for: .normal)
                optionB.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                optionC.setTitle("", for: .normal)
                optionC.setImage(UIImage(named: questionList.list[questionNumber].optionC), for: .normal)
                optionC.imageView?.contentMode = .scaleAspectFit
                optionC.setTitleColor(.black, for: .normal)
                optionC.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                
                optionD.setTitle("", for: .normal)
                optionD.setImage(UIImage(named: questionList.list[questionNumber].optionD), for: .normal)
                optionD.imageView?.contentMode = .scaleAspectFit
                optionD.setTitleColor(.black, for: .normal)
                optionD.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
            }
            else {
                optionA.setImage(nil, for: .normal)
                optionA.setTitle(questionList.list[questionNumber].optionA, for: .normal)
                optionA.setTitleColor(UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0), for: .normal)
                optionA.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                optionB.setImage(nil, for: .normal)
                optionB.setTitle(questionList.list[questionNumber].optionB, for: .normal)
                optionB.setTitleColor(UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0), for: .normal)
                optionB.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                optionC.setImage(nil, for: .normal)
                optionC.setTitle(questionList.list[questionNumber].optionC , for: .normal)
                optionC.setTitleColor(UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0), for: .normal)
                optionC.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
                optionD.setImage(nil, for: .normal)
                optionD.setTitle(questionList.list[questionNumber].optionD, for: .normal)
                optionD.setTitleColor(UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0), for: .normal)
                optionD.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.95)
                
            }
            
            updateUI()
            
        }else {
            let finishQuizzViewController = FinishScreenViewController()
            finishQuizzViewController.score = self.score
            self.present(finishQuizzViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
    func updateUI(){
        lblQuestionNumber.text = "\(questionNumber+1)/\(questionList.list.count)"
    }
    
    func restartQuiz(){
        questionNumber = 0
        updateQuestion()
        score = 0
        progressView.setProgressWithAnimation(duration: 0, fromValue: score, value: 0)
    }
    
    
}
