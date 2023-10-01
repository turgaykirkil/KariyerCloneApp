//
//  BenzerIlanlarTableViewCell.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 27.09.2023.
//

import UIKit

class BenzerIlanlarTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var benzerIlanlarList = [BenzerIlanlar]()
    
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
        let benzerIlanlarCollectionCellNib: UINib = UINib(nibName: "BenzerIlanlarCollectionView", bundle: nil)
        collectionView.register(benzerIlanlarCollectionCellNib, forCellWithReuseIdentifier: "BenzerIlanlarCollectionViewCell")
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
        let benzerIlanData = [
            "benzerIlan1",
            "benzerIlan2",
            "benzerIlan3",
            "benzerIlan4",
            "benzerIlan5",
            "benzerIlan6"
        ]
        
        for imageName in benzerIlanData {
            let ilan = BenzerIlanlar(benzerilan_id: benzerIlanData.count + 1, benzerilan_name: imageName)
            benzerIlanlarList.append(ilan)
        }

    }
    
}

extension BenzerIlanlarTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return benzerIlanlarList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenzerIlanlarCollectionViewCell", for: indexPath) as? BenzerIlanlarCollectionViewCell {
            let ilan = benzerIlanlarList[indexPath.row]
            cell.imageView.image = UIImage(named: ilan.benzerilan_name!)
               return cell
        }
        return UICollectionViewCell()
    }
    
}
