import Foundation
import UIKit

public class StartScreenViewController: UIViewController {
    
    
    public override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "bg2.jpg")
        background.frame = CGRect(x: 0, y: 0, width: 720, height: 1080)
        view.addSubview(background)
        
        
        let labelTitle = UILabel(frame: CGRect(x: w/2-175, y: 350, width: 400, height: 100))
        labelTitle.text = "Lets Start!!!!"
        labelTitle.font = labelTitle.font.withSize(50)
        
        
        view.addSubview(labelTitle)
        
        let startBtn = UIButton(frame: CGRect(x: w/2-65, y: h/2+150, width: 140, height: 40))
        startBtn.backgroundColor = .red
        startBtn.titleLabel?.text = "Start Quizz"
        startBtn.addTarget(self, action: #selector(startTransition(sender:)), for: .touchDown)
        view.addSubview(startBtn)
        
        
        self.view = view
    }
    
    @objc func startTransition(sender: UIButton) {
        let viewController = ViewController()
        self.present(viewController, animated: true, completion: nil)
    }
}
