import Foundation
import UIKit

public class FinishQuizzViewController: UIViewController {
    
    public var progress: Float = 0
    
    public override func loadView() {
    
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "bg2.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
      
       
        let labelTitle = UILabel(frame: CGRect(x: w/2-175, y: 350, width: 400, height: 100))
        labelTitle.text = "Congratulations!!"
        labelTitle.font = labelTitle.font.withSize(50)
        
        
        view.addSubview(labelTitle)

        
        
        let labelText = UILabel(frame: CGRect(x: w/2-225, y: 450, width: 450, height: 200))
        labelText.backgroundColor = .red
        
        view.addSubview(labelText)
        
        
        let progressView = ProgressCircularView(frame: CGRect(x: w/2-200 , y: h/2+100 , width: 200, height: 200))
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 2.0/255, green: 156.0/255, blue: 124.0/255, alpha: 1.0)

        let labelProgress = UILabel(frame: CGRect(x: w/2-65, y: h/2+150, width: 140, height: 40))
        labelProgress.font = labelProgress.font.withSize(30)
        labelProgress.textAlignment = .center
        labelProgress.text = "\(progress*100)%"
        view.addSubview(labelProgress)
        
        progressView.setProgressWithAnimation(duration: 1, fromValue: 0, value: progress)
        view.addSubview(progressView)
        self.view = view
    }
}
