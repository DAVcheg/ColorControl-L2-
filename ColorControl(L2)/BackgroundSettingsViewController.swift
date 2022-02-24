//
//  BackgroundSettingsViewController.swift
//  ColorControl(L2)
//
//  Created by DAV on 12.01.2022.
//

import UIKit

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
    var delegate: BackgroundSettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = backgroundColor
        colorSplitter()
        sliderAction()
        assignbackground()
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.width / 10
    }
    
    // MARK: - IB Actions
    
    @IBAction func sliderAction() {
        redValueLabel.text = String(round(redSlider.value * 100)/100)
        redValueTextEdit.text = redValueLabel.text
        greenValueLabel.text = String(round(greenSlider.value * 100)/100)
        greenValueTextEdit.text = greenValueLabel.text
        blueValueLabel.text = String(round(blueSlider.value * 100)/100)
        blueValueTextEdit.text = blueValueLabel.text
        colorViewAction()
    }
    
    @IBAction func textEditAction(_ sender: Any) {
        redSlider.value = Float(redValueTextEdit.text!) ?? 0.00
        greenSlider.value = Float(greenValueTextEdit.text!) ?? 0.00
        blueSlider.value = Float(blueValueTextEdit.text!) ?? 0.00
        
        sliderAction()
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        delegate.setNewBackgroundColor(for: colorView.backgroundColor ?? UIColor.systemBackground )
        dismiss(animated: true, completion: nil)
    }
    
    
}

// MARK: - Extension

extension BackgroundSettingsViewController: UITextFieldDelegate {
    private func assignbackground(){
        let background = UIImage(named: "shtrihi-cveta-color")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    private func colorViewAction(){
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    private func colorSplitter(){
        var redValue: CGFloat{ return CIColor(color: backgroundColor).red }
        var greenValue: CGFloat{ return CIColor(color: backgroundColor).green }
        var blueValue: CGFloat{ return CIColor(color: backgroundColor).blue }
        redSlider.value = Float(redValue)
        greenSlider.value = Float(greenValue)
        blueSlider.value = Float(blueValue)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func checkTypeTextInFiels(_ textField: UITextField) {
        guard let curentText = Float(textField.text!) else { return }
        let maxValue:Float = 1.00
        
        if curentText > maxValue {
            showAlert(title:"Attention", message: "Enter a color value in the format 0.00 to 1.00")
        }
    }
    
}
