//
//  MyCollectionViewController.swift
//  collection
//
//  Created by Alebelly Nemesis on 8/14/22.
//

import UIKit

let imageUrls: [String] = ["https://wallpapers.com/images/file/starry-night-and-celestial-bodies-hoztgf3afa0blfvc.jpg",
						  "https://wallpapers.com/images/file/purple-and-pink-galaxy-hdg0eaitkhrstbyu.jpg",
						  "https://wallpapers.com/images/file/4k-andromeda-galaxy-68af0gq8brnv6qkk.jpg",
						  "https://wallpapers.com/images/file/milky-way-galaxy-hgmbmxbzl589p8q4.jpg"]

class MyCollectionViewController: UIViewController {

	@IBOutlet weak var myCollectionView: UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
	
		self.myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil),
			forCellWithReuseIdentifier: "MyCollectionViewCell")
		self.myCollectionView.dataSource = self
		self.myCollectionView.delegate = self
    }
	
}

extension MyCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
		
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return imageUrls.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell",
			for: indexPath) as! MyCollectionViewCell
		loadImage(url: URL(string: imageUrls[indexPath.row])!, view: self, cell: cell)
 		return cell
	}
	
	func loadImage(url: URL, view: MyCollectionViewController, cell: MyCollectionViewCell) {
		DispatchQueue.global().async { [weak view] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						cell.myImage.image = image
						cell.imageLoadIndicator.stopAnimating()
					}
				}
			} else {
				let alert = UIAlertController(title: "Error", message: "Cannot acces to \(url)", preferredStyle: UIAlertController.Style.alert)
				alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
				DispatchQueue.main.async {
					view?.present(alert, animated: true, completion: nil)
					cell.imageLoadIndicator.stopAnimating()
				}
			}
		}
	}
}

