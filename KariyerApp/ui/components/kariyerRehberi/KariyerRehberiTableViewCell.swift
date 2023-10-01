//
//  KariyerRehberiTableViewCell.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 28.09.2023.
//

import UIKit

class KariyerRehberiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var rehberList = [KariyerRehberi]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureData()
        configureCollectionViewLayout()
        customNibs()
        addData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func customNibs() {
        let kariyerRehberiCollectionCellNib: UINib = UINib(nibName: "KariyerRehberiCollectionView", bundle: nil)
        collectionView.register(kariyerRehberiCollectionCellNib, forCellWithReuseIdentifier: "KariyerRehberiCollectionViewCell")
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .horizontal
        let screenWidth = collectionView.frame.size.width
        let itemHeight = collectionView.frame.size.height

        layout.itemSize = CGSize(width: screenWidth / 3, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    private func addData() {
        let rehberData = [
            "rehber1",
            "rehber2",
            "rehber3",
            "rehber4"
        ]
        
        for imageName in rehberData {
            let rehber = KariyerRehberi(image_id: rehberData.count + 1, image_name: imageName)
            rehberList.append(rehber)
        }

    }
    
}

extension KariyerRehberiTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rehberList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KariyerRehberiCollectionViewCell", for: indexPath) as? KariyerRehberiCollectionViewCell {
            let rehber = rehberList[indexPath.row]
            cell.imageView.image = UIImage(named: rehber.image_name!)
               return cell
        }
        return UICollectionViewCell()
    }
    
}
