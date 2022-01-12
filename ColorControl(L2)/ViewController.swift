//
//  ViewController.swift
//  ColorControl(L2)
//
//  Created by DAV on 12.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }

    
    func assignbackground(){
          let background = UIImage(named: "shtrihi-cveta-color")

          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
          imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }

}

