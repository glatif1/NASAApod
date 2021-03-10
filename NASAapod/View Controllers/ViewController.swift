//
//  ViewController.swift
//  NASAapod
//
//  Created by Ghufran Latif  on 3/1/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    
    private let apodVM = ApodViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "NASA API"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        var url = Api_url
        url.append(Api_Key)
        guard let urlu = URL(string: url) else {
            return
        }
 
        apodVM.getDataFromProvider(url: urlu) {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apodVM.numOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NASACollectionViewCell", for: indexPath) as? NASACollectionViewCell
        cell?.setUp(apodVM: apodVM)
        return cell!
    }
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.apodVM = apodVM
        navigationController?.pushViewController(vc, animated: true)
    }
}

