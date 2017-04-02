//
//  SettingsVC.swift
//  SketchPal
//
//  Created by Ali Mohammadian on 12/31/16.
//  Copyright © 2016 Zyasco. All rights reserved.
//

import UIKit
import GoogleMobileAds

protocol SettingsVCDelegate: class {
    func settingsViewControllerDidFinish(_ settingsVC: SettingsVC)
}


class SettingsVC: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet var settingsBanner: GADBannerView!
    @IBOutlet var brushSizeLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!

    @IBOutlet var opacityLabel: UILabel!
    
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var redLabel: UILabel!
    
    @IBOutlet var blueLabel: UILabel!
    @IBAction func opacityChanged(_ sender: Any) {
    }
    
    @IBAction func brushSizeChanged(_ sender: Any) {
    }
    
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueSlider: UISlider!
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    var delegate: SettingsVCDelegate?
    
    @IBAction func redSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value * 255))"
        
    }
    
    @IBAction func blueSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
    @IBAction func greenSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    
    func drawPreview(red: CGFloat, green: CGFloat, blue: CGFloat) {
        imageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondRequest = GADRequest()
        secondRequest.testDevices = [kGADSimulatorID]
        settingsBanner.delegate = self
        settingsBanner.adUnitID = "ca-app-pub-7340562758794459/6171384120"
        settingsBanner.rootViewController = self
        settingsBanner.load(secondRequest)

        // Do any additional setup after loading the view.
        
        drawPreview(red: red, green: green, blue: blue)
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: Any) {
        if delegate != nil {
            delegate?.settingsViewControllerDidFinish(self)
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
