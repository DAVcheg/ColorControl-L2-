//
//  BackgroundViewController.swift
//  ColorControl(L2)
//
//  Created by Aleksey Dergunov on 18.02.2022.
//

import UIKit

protocol BackgroundSettingsViewControllerDelegate {
    func setNewBackgroundColor(for color: UIColor)
}

class BackgroundViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let navigationVC = segue.destination as? UINavigationController else { return }
//        guard let backgroundSetVC = navigationVC.topViewController as? BackgroundSettingsViewController else { return }
        let backgroundSetVC = segue.destination as! BackgroundSettingsViewController
        backgroundSetVC.delegate = self
        backgroundSetVC.backgroundColor = view.backgroundColor
    }
}

extension BackgroundViewController: BackgroundSettingsViewControllerDelegate{

    func setNewBackgroundColor(for color: UIColor){
    view.backgroundColor = color
}

}
