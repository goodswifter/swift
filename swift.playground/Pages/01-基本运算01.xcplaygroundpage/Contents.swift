
//: # Hello World
print("Hello World!")

let a = 10
let b = 20
var c = a + b
c += 30

c = 30

//: # View
import UIKit
import PlaygroundSupport

//: ## UIView
let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = view

//: ## UIImageView
let imageView = UIImageView(image: UIImage(named: "logo"))
PlaygroundPage.current.liveView = imageView

//: # UIViewController
let vc = UITableViewController()
vc.view.backgroundColor = UIColor.lightGray
PlaygroundPage.current.liveView = vc
