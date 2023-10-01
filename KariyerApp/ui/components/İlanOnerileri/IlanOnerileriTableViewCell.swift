//
//  IlanOnerileriTableViewCell.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 28.09.2023.
//

import UIKit

class IlanOnerileriTableViewCell: UITableViewCell {


    @IBOutlet weak var collectionView: UICollectionView!
    var oneriList = [IlanOnerileri]()
    
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
        let ilanOnerileriCollectionCellNib: UINib = UINib(nibName: "IlanOnerileriCollectionView", bundle: nil)
        collectionView.register(ilanOnerileriCollectionCellNib, forCellWithReuseIdentifier: "IlanOnerileriCollectionViewCell")
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        let screenWidth = collectionView.frame.size.width
        let itemHeight = collectionView.frame.size.height

        layout.itemSize = CGSize(width: screenWidth / 2.5, height: itemHeight / 1.3)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    private func addData() {
        let oneriData = [
            "oneri1",
            "oneri2",
            "oneri3",
            "oneri4",
            "oneri5",
            "oneri6"
        ]
        
        for imageName in oneriData {
            let oneri = IlanOnerileri(image_id: oneriList.count + 1, image_name: imageName)
            oneriList.append(oneri)
        }

    }
    
}

extension IlanOnerileriTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oneriList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IlanOnerileriCollectionViewCell", for: indexPath) as? IlanOnerileriCollectionViewCell {
            let oneri = oneriList[indexPath.row]
            cell.imageView.image = UIImage(named: oneri.image_name!)
               return cell
        }
        return UICollectionViewCell()
    }
    
    
}
