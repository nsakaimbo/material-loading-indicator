import UIKit

public class LoadingIndicatorView: UIView {

    public var lineWidth: CGFloat = 4.0 {
        didSet {
            circleLayer.lineWidth = lineWidth
        }
    }
    public var indicatorColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            circleLayer.strokeColor = indicatorColor.CGColor
        }
    }
   
    public var headDuration: CFTimeInterval = 1.0
 
    public var tailDelay: CFTimeInterval = 0.3
    
    public var tailDuration: CFTimeInterval = 1.3
    
    public var rotates: Bool = true
    
    public var rotationDuration: CFTimeInterval = 4.0
    
    private func strokeAnimation() -> CAAnimation {
        
        let strokeEndAnimation: CAAnimation = {
        
            $0.fromValue = 0.0
            $0.toValue = 1.0
            $0.duration = headDuration
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            return $0
            
        }(CABasicAnimation(keyPath: "strokeEnd"))
        
        let strokeStartAnimation: CAAnimation = {
            
            $0.beginTime = tailDelay
            $0.fromValue = 0.0
            $0.toValue = 1.0
            $0.duration = tailDuration
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            return $0
            
        }(CABasicAnimation(keyPath: "strokeStart"))
    
        let group = CAAnimationGroup()
        group.duration = max(strokeEndAnimation.beginTime + strokeEndAnimation.duration, strokeStartAnimation.beginTime + strokeStartAnimation.duration)
        group.repeatCount = MAXFLOAT
        group.animations = [strokeEndAnimation, strokeStartAnimation]
        
        return group
    }
    
    private func rotationAnimation() -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat(M_PI * 2)
        animation.repeatCount = MAXFLOAT
        animation.duration = rotationDuration
        return animation
    }
    
    private let circleLayer = CAShapeLayer()
 
    private let π = CGFloat(M_PI)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
  
    private func commonInit() {
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = nil
        circleLayer.strokeColor = indicatorColor.CGColor
        layer.addSublayer(circleLayer)
        backgroundColor = UIColor.clearColor()
    }
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        
        let padding: CGFloat = 10.0
        
        let center = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
        
        let radius = (min(bounds.width, bounds.height) - circleLayer.lineWidth) / 2 - padding
        
        circleLayer.frame = self.bounds
        
        let startAngle = 3 * π / 2
        
        let endAngle = startAngle + 2 * π
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.path = path.CGPath
    }
   
    public func animate() {
        
        circleLayer.addAnimation(strokeAnimation(), forKey: "stroke")
        
        if rotates { circleLayer.addAnimation(rotationAnimation(), forKey: "rotation") }
    }
    
    public func stopAnimating() {
        
        circleLayer.removeAnimationForKey("stroke")
        
        if rotates { circleLayer.removeAnimationForKey("rotation") }
    }
}