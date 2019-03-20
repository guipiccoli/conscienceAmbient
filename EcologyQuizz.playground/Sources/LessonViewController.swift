import Foundation
import UIKit

public class LessonViewController: UIViewController {

    public override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        
        
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "bg3.jpg")
        background.frame = CGRect(x: 0, y: 0, width: w, height: h)
        view.addSubview(background)
        
        
        let labelTitle = UILabel(frame: CGRect(x: w/2-200, y: 150, width: 400, height: 100))
        labelTitle.font = labelTitle.font.withSize(50)
        labelTitle.textAlignment = .center
        labelTitle.adjustsFontSizeToFitWidth = true
        
        
        let labelText = UILabel(frame: CGRect(x: w/2-225, y: 175, width: 450, height: 300))
        labelText.font = labelText.font.withSize(30)
        labelText.numberOfLines = 4
        labelText.textAlignment = .center
        labelText.text = "Well Done! You're conscious about sustainability, but you still have something to learn in the next chapter."
        labelTitle.text = "Congratulations!!"
        
        view.addSubview(labelTitle)
        view.addSubview(labelText)
        
        
        
        self.view = view
    }
}
