//  DetailViewController.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/3/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    var apodVM: ApodViewModel?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = apodVM?.getTitle()
        descTextView.text = apodVM?.getDetails()
        imgView.sd_setImage(with: apodVM?.getImageUrl())
        dateLabel.text = apodVM?.getDate()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
