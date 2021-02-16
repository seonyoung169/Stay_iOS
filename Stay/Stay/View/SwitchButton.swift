//
//  SwitchButton.swift
//  Stay
//
//  Created by SEONYOUNG LEE on 2021/02/12.
//

import Foundation
import UIKit

protocol SwieeftSwitchButtonDelegate: class {
    func isOnValueChange(isOn: Bool)
}

class SwitchButton : UIButton {
    typealias SwitchColor = (bar : UIColor, circle : UIColor)
    
    private var barView : UIView!
    private var circleView : UIView!
    private var isAnimated: Bool = false
    weak var delegate: SwieeftSwitchButtonDelegate?
    
    var barViewTopBottomMargin : CGFloat = 5
    var animationDuration: TimeInterval = 0.25
    
    var isOn: Bool = false {
      didSet {
        self.changeState()
      }
    }
    
    var onColor : SwitchColor = (UIColor(red: 99/255, green: 202/255, blue: 206/255, alpha: 0.2), UIColor(red: 99/255, green: 202/255, blue: 206/255, alpha: 1)) {
        didSet {
            if isOn {
                self.barView.backgroundColor = self.onColor.bar
                self.circleView.backgroundColor = self.onColor.circle
            }
        }
    }
    
    var offColor: SwitchColor = (#colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1), #colorLiteral(red: 0.7709601521, green: 0.7709783912, blue: 0.7709685564, alpha: 1)) {
      didSet {
        if isOn == false {
          self.barView.backgroundColor = self.offColor.bar
          self.circleView.backgroundColor = self.offColor.circle
        }
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buttonInit(frame: frame)
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        self.buttonInit(frame: frame)
    }
    
    private func buttonInit(frame: CGRect){
        let barViewHeight = frame.height - (barViewTopBottomMargin * 2)
        
        barView = UIView(frame: CGRect(x: 0, y: barViewTopBottomMargin, width: frame.width, height: barViewHeight))
        barView.backgroundColor = self.offColor.bar
        barView.layer.masksToBounds = true
        barView.layer.cornerRadius = barViewHeight / 2
        
        self.addSubview(barView)
        
        circleView = UIView(frame: CGRect(x: 0, y: 0, width: frame.height, height: frame.height))
        circleView.backgroundColor = self.offColor.circle
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = frame.height / 2
        
        self.addSubview(circleView)
    }
    
    private func changeState() {
        var circleCenter: CGFloat = 0
        var barViewColor: UIColor = .clear
        var circleViewColor: UIColor = .clear

        if self.isOn {
          circleCenter = self.frame.width - (self.circleView.frame.width / 2)
          barViewColor = self.onColor.bar
          circleViewColor = self.onColor.circle
        } else {
          circleCenter = self.circleView.frame.width / 2
          barViewColor = self.offColor.bar
          circleViewColor = self.offColor.circle
        }

        let duration = self.isAnimated ? self.animationDuration : 0

        UIView.animate(withDuration: duration, animations: { [weak self] in
          guard let self = self else { return }

          self.circleView.center.x = circleCenter
          self.barView.backgroundColor = barViewColor
          self.circleView.backgroundColor = circleViewColor

        }) { [weak self] _ in
          guard let self = self else { return }

          self.delegate?.isOnValueChange(isOn: self.isOn)
          self.isAnimated = false
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.setOn(on: !self.isOn, animated: true)
    }

    func setOn(on: Bool, animated: Bool) {
      self.isAnimated = animated
      self.isOn = on
    }
}
