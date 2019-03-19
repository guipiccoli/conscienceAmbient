//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let viewController = StartScreenViewController()
viewController.preferredContentSize = CGSize(width: 720, height: 1080)
PlaygroundPage.current.liveView = viewController
