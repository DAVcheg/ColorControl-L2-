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
    var redSliderValue: CGFloat = 0
    var greenSliderValue: CGFloat = 0
    var blueSliderValue: CGFloat = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        redSliderValue = CGFloat(redSlider.value)
        redValueLabel.text = String(round(redSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.isHidden = false
        greenSliderValue = CGFloat(greenSlider.value)
        greenValueLabel.text = String(round(greenSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.isHidden = false
        blueSliderValue = CGFloat(blueSlider.value)
        blueValueLabel.text = String(round(blueSlider.value * 100)/100)
        colorViewAction()
    }
    func colorViewAction(){
        colorView.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: 1)
    }
    
    // MARK: - private Methods
//функция создания фона из изображения
func assignbackground(){
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
