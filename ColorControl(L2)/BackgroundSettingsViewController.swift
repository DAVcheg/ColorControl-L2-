//
//  BackgroundSettingsViewController.swift
//  ColorControl(L2)
//
//  Created by DAV on 12.01.2022.
//

import UIKit

//Protocol BackgroundLink {
//
//}

class BackgroundSettingsViewController: UIViewController {
    
    // MARK: - IB Outlets

    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redValueTextEdit: UITextField!
    @IBOutlet var greenValueTextEdit: UITextField!
    @IBOutlet var blueValueTextEdit: UITextField!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Public Properties
    
    var backgroundColor: UIColor!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = backgroundColor
        assignbackground()
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.width / 10
    }
    
    // MARK: - IB Actions
    
    @IBAction func SliderAction() {
        redValueLabel.text = String(round(redSlider.value * 100)/100)
        redValueTextEdit.text = redValueLabel.text
        greenValueLabel.text = String(round(greenSlider.value * 100)/100)
        greenValueTextEdit.text = greenValueLabel.text
        blueValueLabel.text = String(round(blueSlider.value * 100)/100)
        blueValueTextEdit.text = blueValueLabel.text
        colorViewAction()
    }
    
    @IBAction func TextEditAction(_ sender: Any) {
        redSlider.value = Float(redValueTextEdit.text!) ?? 0.00
        greenSlider.value = Float(greenValueTextEdit.text!) ?? 0.00
        blueSlider.value = Float(blueValueTextEdit.text!) ?? 0.00
        SliderAction()
    }
    
    
}
    
    // MARK: - Extension

extension BackgroundSettingsViewController {
private func assignbackground(){
        let background = UIImage(named: "shtrihi-cveta-color")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        //разрешаем обрезку изображения по границам view
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        //передаем аргумент в метод addSubview (создание нового слоя)
        view.addSubview(imageView)
        //метод переноса нового слоя на задний фон
        self.view.sendSubviewToBack(imageView)
    }

    private func colorViewAction(){
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}
