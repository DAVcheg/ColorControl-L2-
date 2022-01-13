//
//  ViewController.swift
//  ColorControl(L2)
//
//  Created by DAV on 12.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var cleanButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanButton.alpha = 0.3
        assignbackground()
        redValueLabel.isHidden = true
        greenValueLabel.isHidden = true
        blueValueLabel.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        colorView.layer.cornerRadius = colorView.frame.width / 2
    }
    
    @IBAction func redSliderAction() {
        redValueLabel.isHidden = false
        redValueLabel.text = String(round(redSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.isHidden = false
        greenValueLabel.text = String(round(greenSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.isHidden = false
        blueValueLabel.text = String(round(blueSlider.value * 100)/100)
        colorViewAction()
    }
    private func colorViewAction(){
        colorView.alpha = 1
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func cleanButtonAction() {
        colorView.alpha = 0
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        redValueLabel.isHidden = true
        greenValueLabel.isHidden = true
        blueValueLabel.isHidden = true
    }
    
    
    // MARK: - private Methods
    //функция создания фона из изображения
    private func assignbackground(){
        //создаем константу с указанием изображения в assets
        let background = UIImage(named: "shtrihi-cveta-color")
        // создаем экземпляр класса работы с изображениями и передаем нужный view для работы
        let imageView = UIImageView(frame: view.bounds)
        // выбираем тип масштабирования изображения
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        //разрешаем обрезку изображения по границам view
        imageView.clipsToBounds = true
        //указываем какой использовать фон
        imageView.image = background
        //устанавливаем изображение по центру
        imageView.center = view.center
        //передаем параметры в метод addSubview (создание нового слоя)
        view.addSubview(imageView)
        //метод переноса нового слоя на задний фон
        self.view.sendSubviewToBack(imageView)
    }
    
}
