import Foundation
import UIKit

public class StartScreenViewController: UIViewController {
    
    
    public override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "bg3.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        
        let labelTitle = UILabel(frame: CGRect(x: w/2-150, y: 350, width: 300, height: 100))
        labelTitle.text = "Lets Start!!!!"
        labelTitle.backgroundColor = .red
        labelTitle.textAlignment = .center
        labelTitle.font = labelTitle.font.withSize(50)
        
        view.addSubview(labelTitle)
        
        
        let progressView = ProgressCircularView(frame: CGRect(x: w/2-150 , y: h/2-170 , width: 150, height: 150))
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
