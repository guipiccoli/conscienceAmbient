import Foundation

import UIKit

public class ProgressCircularView: UIView {
    
    public var progressLayer = CAShapeLayer()
    public var trackLayer = CAShapeLayer()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    public var progressColor = UIColor.red {
        didSet {
            self.progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    public var trackColor = UIColor.white {
        didSet {
            self.trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    public func createCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        self.trackLayer.path = circlePath.cgPath
        self.trackLayer.fillColor = UIColor.clear.cgColor
        self.trackLayer.strokeColor = trackColor.cgColor
        self.trackLayer.lineWidth = 10.0
        self.trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        self.progressLayer.path = circlePath.cgPath
        self.progressLayer.fillColor = UIColor.clear.cgColor
        self.progressLayer.strokeColor = progressColor.cgColor
        self.progressLayer.lineWidth = 10.0
        self.progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    public func setProgressWithAnimation(duration: TimeInterval, fromValue: Float, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.progressLayer.strokeEnd = CGFloat(value)
        self.progressLayer.add(animation, forKey: "animateprogress")
    }
    
    
    
}
