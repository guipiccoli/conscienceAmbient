import Foundation
import UIKit

public class FinishLessonViewController: UIViewController {
    
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
        
        
        let labelTitle = UILabel(frame: CGRect(x: w/2-400, y: 160, width: 800, height: 200))
        labelTitle.font = UIFont(name: "Futura-Bold", size: 50)
        labelTitle.textColor = UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0)
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 2
        labelTitle.text = "Thank you!"
        
        
        let labelText = UILabel(frame: CGRect(x: w/2-225, y: h/2-100, width: 450, height: 300))
        labelText.font = UIFont(name: "Futura-Bold", size: 30)
        labelText.textColor = UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0)
        labelText.numberOfLines = 4
        labelText.textAlignment = .center
        labelText.adjustsFontSizeToFitWidth = true
        
        
        
        let buttonMainPage = UIButton(frame: CGRect(x: w/2-150, y: h/2+400, width: 300, height: 60))
        buttonMainPage.titleLabel?.textAlignment = .center
        buttonMainPage.setTitle("Menu", for: .normal)
        buttonMainPage.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        buttonMainPage.layer.cornerRadius = 20
        buttonMainPage.titleLabel?.font = UIFont(name: "Futura", size: 20)
        buttonMainPage.setTitleColor(UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0), for: .normal)
        buttonMainPage.addTarget(self, action: #selector(mainPageTransition(sender:)), for: .touchDown)
    
        
        view.addSubview(labelText)
        view.addSubview(buttonMainPage)
        view.addSubview(labelTitle)
        
       
        self.view = view
    }
    
    
    @objc func mainPageTransition(sender: UIButton) {
        let startScreen = StartScreenViewController()
        self.present(startScreen, animated: true, completion: nil)
    }
}
