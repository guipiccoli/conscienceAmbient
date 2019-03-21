import Foundation
import UIKit

public class StartScreenViewController: UIViewController {
    
    
    public override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "background.png")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.frame = CGRect(x: w/2-225, y: 60, width: 450, height: 150)
        
        view.addSubview(logo)
        
        
        
        
        let labelTitle = UILabel(frame: CGRect(x: w/2-250, y: 400, width: 500, height: 300))
        labelTitle.text = "That's your progress, you still have 0%, let's see you much you can get!"
        labelTitle.numberOfLines = 4
        labelTitle.textAlignment = .center
        labelTitle.font = labelTitle.font.withSize(35)
        
        view.addSubview(labelTitle)
        
        
        let progressView = ProgressCircularView(frame: CGRect(x: w/2-150 , y: h/2-300 , width: 150, height: 150))
        progressView.trackColor = UIColor.lightGray
        progressView.progressColor = UIColor(red: 116.0/255, green: 162.0/255, blue: 38.0/255, alpha: 1.0)

        view.addSubview(progressView)
        
        
        
        let startBtn = UIButton(frame: CGRect(x: w/2-150, y: h/2+400, width: 300, height: 60))
        startBtn.titleLabel?.textAlignment = .center
        startBtn.setTitle("Start Quiz", for: .normal)
        startBtn.titleLabel?.font = startBtn.titleLabel?.font.withSize(20)
        startBtn.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        startBtn.layer.cornerRadius = 20
        startBtn.setTitleColor(.black, for: .normal)
        startBtn.addTarget(self, action: #selector(startTransition(sender:)), for: .touchDown)
        view.addSubview(startBtn)
        
        
        
        self.view = view
    }
    
    @objc func startTransition(sender: UIButton) {
        let viewController = QuizViewController()
        self.present(viewController, animated: true, completion: nil)
    }
}
