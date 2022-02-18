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
        colorView.layer.cornerRadius = colorView.frame.width / 2
    }
    
    // MARK: - IB Actions
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(round(redSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(round(greenSlider.value * 100)/100)
        colorViewAction()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(round(blueSlider.value * 100)/100)
        colorViewAction()
    }
    
}
    
    // MARK: - Extension

extension BackgroundSettingsViewController {
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

    private func colorViewAction(){
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}
