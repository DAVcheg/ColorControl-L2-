//
//  BackgroundViewController.swift
//  ColorControl(L2)
//
//  Created by Aleksey Dergunov on 18.02.2022.
//

import UIKit


class BackgroundViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.backgroundColor = UIColor.green
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let navigationVC = segue.destination as? UINavigationController else { return }
//        guard let backgroundSetVC = navigationVC.topViewController as? BackgroundSettingsViewController else { return }
        let backgroundSetVC = segue.destination as! BackgroundSettingsViewController
        backgroundSetVC.backgroundColor = view.backgroundColor
    }
}
