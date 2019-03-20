import Foundation
import UIKit

public class FinishScreenViewController: UIViewController {
    
    public var progress: Float = 0
    
    public override func loadView() {
    
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "bg3.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
      
       
        let labelTitle = UILabel(frame: CGRect(x: w/2-200, y: 150, width: 400, height: 100))
        labelTitle.font = labelTitle.font.withSize(50)
        labelTitle.textAlignment = .center
        labelTitle.adjustsFontSizeToFitWidth = true

        
        let labelText = UILabel(frame: CGRect(x: w/2-225, y: 175, width: 450, height: 300))
        labelText.font = labelText.font.withSize(30)
        labelText.numberOfLines = 4
        labelText.textAlignment = .center
        if progress*100 > 50 {
            labelText.text = "Well Done! You're \(progress*100)% conscious about sustainability, but you still have something to learn in the next chapter."
            labelTitle.text = "Congratulations!!"

        }
        else {
            labelText.text = "You're \(progress*100)% conscious about Sustainability, you still have a lot to learn to make the world a better place!! We can help you in the next chapter."
            labelTitle.text = "Start making a difference"
        }
        labelText.adjustsFontSizeToFitWidth = true


        
        let buttonMainPage = UIButton(frame: CGRect(x: w/2-150, y: h/2+400, width: 300, height: 60))
        buttonMainPage.titleLabel?.textAlignment = .center
        buttonMainPage.setTitle("Menu", for: .normal)
        buttonMainPage.titleLabel?.font = buttonMainPage.titleLabel?.font.withSize(20)
        buttonMainPage.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        buttonMainPage.layer.cornerRadius = 20
        //buttonNextChapter.layer.borderWidth = 2
        //buttonNextChapter.layer.borderColor = UIColor.black.cgColor;
        buttonMainPage.setTitleColor(.black, for: .normal)
        buttonMainPage.addTarget(self, action: #selector(mainPageTransition(sender:)), for: .touchDown)
        
        let buttonNextChapter = UIButton(frame: CGRect(x: w/2-150, y: h/2+320, width: 300, height: 60))
        buttonNextChapter.titleLabel?.numberOfLines = 2
        buttonNextChapter.titleLabel?.textAlignment = .center
        buttonNextChapter.setTitle("Let's check it out!!", for: .normal)
        buttonNextChapter.titleLabel?.font = buttonNextChapter.titleLabel?.font.withSize(20)
        buttonNextChapter.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        buttonNextChapter.layer.cornerRadius = 20
        //buttonNextChapter.layer.borderWidth = 2
        //buttonNextChapter.layer.borderColor = UIColor.black.cgColor;
        buttonNextChapter.setTitleColor(.black, for: .normal)
        buttonNextChapter.addTarget(self, action: #selector(lessonTransition(sender:)), for: .touchDown)
        
        
        view.addSubview(labelText)
        view.addSubview(buttonNextChapter)
        view.addSubview(buttonMainPage)
        view.addSubview(labelTitle)

        
        
        let progressView = ProgressCircularView(frame: CGRect(x: w/2-150 , y: h/2-170 , width: 150, height: 150))
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)

//        let labelProgress = UILabel(frame: CGRect(x: w/2-65, y: h/2+150, width: 140, height: 40))
//        labelProgress.font = labelProgress.font.withSize(30)
//        labelProgress.textAlignment = .center
//        labelProgress.text = "\(progress*100)%"
//        view.addSubview(labelProgress)
        
        progressView.setProgressWithAnimation(duration: 2, fromValue: 0, value: progress)
        view.addSubview(progressView)
        self.view = view
    }
    
    @objc func lessonTransition(sender: UIButton) {
        let lessonViewController = LessonViewController()
        self.present(lessonViewController, animated: true, completion: nil)
    }
    @objc func mainPageTransition(sender: UIButton) {
        let startScreen = StartScreenViewController()
        self.present(startScreen, animated: true, completion: nil)
    }
}
