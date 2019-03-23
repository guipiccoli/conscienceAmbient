import Foundation
import UIKit
import PlaygroundSupport

public class LessonViewController: UIViewController {
    
    public let curiosityList = CuriosityBank()
    public var curiosityNumber: Int = 0
    
    
    public let labelTitle = UILabel()
    public let imageView = UIImageView()
    public let backButton = UIButton()
    public let labelText = UILabel()
    public let nextButton = UIButton()
    
    public override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 720, height: 1080))
        let h = view.bounds.size.height
        let w = view.bounds.size.width
        
        let background = UIImageView()
        background.image = UIImage(named: "background.png")
        background.frame = CGRect(x: 0, y: 0, width: w, height: h)
        view.addSubview(background)
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.frame = CGRect(x: 135, y: 60, width: 450, height: 150)
        view.addSubview(logo)
        
        labelTitle.frame = CGRect(x: w/2-300, y: 180, width: 600, height: 125)
        labelTitle.font = UIFont(name: "Futura-Bold", size: 50)
        labelTitle.textColor = UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0)
        labelTitle.textAlignment = .center
        labelTitle.text = curiosityList.list[curiosityNumber].curiosityTitle
        labelTitle.adjustsFontSizeToFitWidth = true
        
        imageView.frame = CGRect(x: w/2-80, y: 310, width: 160, height: 160)
        imageView.image = UIImage(named: curiosityList.list[curiosityNumber].image)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        
        labelText.frame = CGRect(x: w/2-310, y: 490, width: 620, height: 400)
        labelText.font = UIFont(name: "Futura", size: 31)
        labelText.textColor = UIColor.init(red: 61.0/255, green: 119.0/255, blue: 133.0/255, alpha: 1.0)
        labelText.text = curiosityList.list[curiosityNumber].curiosityText
        labelText.numberOfLines = 0
        
        
        let attributtedString = NSMutableAttributedString(string: labelText.text ?? "")
        attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: NSRange(location: 0, length: 7))
        let rangeOfReuse = NSString(string: attributtedString.string).range(of: "Reuse")
        attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: rangeOfReuse)
        let rangeOfRecycle = NSString(string: attributtedString.string).range(of: "Recycle")
        attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: rangeOfRecycle)
        labelText.attributedText = attributtedString
        labelText.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        labelText.layer.cornerRadius = 20
        labelText.layer.masksToBounds = true
        labelText.textAlignment = .center
        labelText.adjustsFontSizeToFitWidth = true
        
        //        labelText.text = "Well Done! You're conscious about sustainability, but you still have something to learn in the next chapter."
        //        labelTitle.text = "Plastic"
        
        view.addSubview(labelTitle)
        view.addSubview(labelText)
        
        backButton.frame = CGRect(x: 50, y: h/2+400, width: 150, height: 60)
        backButton.setImage(UIImage(named: "backIcon.png"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        backButton.layer.cornerRadius = 20
        backButton.addTarget(self, action: #selector(prevCuriosity(sender:)), for: .touchDown)
        
        
        nextButton.frame =  CGRect(x: 520, y: h/2+400, width: 150, height: 60)
        nextButton.setImage(UIImage(named: "nextIcon.png"), for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        nextButton.backgroundColor = UIColor.init(red: 238.0/255, green: 237.0/255, blue: 238.0/255, alpha: 0.9)
        nextButton.layer.cornerRadius = 20
        nextButton.addTarget(self, action: #selector(nextCuriosity(sender:)), for: .touchDown)
        
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        self.view = view
    }
    
    @objc func nextCuriosity(sender: UIButton) {
        print(curiosityNumber, (curiosityList.list.count-1))
        if curiosityNumber <= curiosityList.list.count - 2{
            curiosityNumber += 1
            self.imageView.image = UIImage(named:(curiosityList.list[curiosityNumber].image))
            self.labelText.text = curiosityList.list[curiosityNumber].curiosityText
            self.labelTitle.text = curiosityList.list[curiosityNumber].curiosityTitle
        }
        else {
            let finishLessonViewController = FinishLessonViewController()
            self.present(finishLessonViewController, animated: true, completion: nil)
        }
    }
    
    @objc func prevCuriosity(sender: UIButton) {
        curiosityNumber -= 1
        
        if curiosityNumber == 0 {
            
            let attributtedString = NSMutableAttributedString(string: curiosityList.list[curiosityNumber].curiosityText ?? "")
            attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: NSRange(location: 0, length: 7))
            let rangeOfReuse = NSString(string: attributtedString.string).range(of: "Reuse")
            attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: rangeOfReuse)
            let rangeOfRecycle = NSString(string: attributtedString.string).range(of: "Recycle")
            attributtedString.addAttributes([.font : UIFont(name: "Futura-Bold", size: 31)], range: rangeOfRecycle)
            labelText.attributedText = attributtedString
            
            self.imageView.image = UIImage(named:(curiosityList.list[curiosityNumber].image))
            self.labelTitle.text = curiosityList.list[curiosityNumber].curiosityTitle
            
        }
        else {
            self.imageView.image = UIImage(named:(curiosityList.list[curiosityNumber].image))
            self.labelText.text = curiosityList.list[curiosityNumber].curiosityText
            self.labelTitle.text = curiosityList.list[curiosityNumber].curiosityTitle
        }
    }
    
}




