//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Victoria Zhou on 3/1/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {

    @IBOutlet weak var starsSlider: UISlider!
    @IBOutlet weak var numStarsLabel: UILabel!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    
    var settings: GithubRepoSearchSettings?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (settings == nil) {
            numStarsLabel.text = "100"
            starsSlider.value = 100
            
            settings = GithubRepoSearchSettings()
            settings?.minStars = 100
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        self.settings?.minStars = Int(starsSlider.value)
        self.delegate?.didSaveSettings(settings: settings!)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.delegate?.didCancelSettings()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSliderChanged(_ sender: Any) {
        self.numStarsLabel.text = "\(Int(starsSlider.value))"
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

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

