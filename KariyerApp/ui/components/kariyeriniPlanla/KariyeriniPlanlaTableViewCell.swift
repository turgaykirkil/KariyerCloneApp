//
//  KariyeriniPlanlaTableViewCell.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 28.09.2023.
//

import UIKit

class KariyeriniPlanlaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureData()
        configureCollectionViewLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = collectionView.frame.size.height
        layout.itemSize = CGSizeMake(screenWidth, screenHeight);
        collectionView.collectionViewLayout = layout
    }
    
    private func customNibs() {
        let kariyeriniPlanlaCollectionCellNib: UINib = UINib(nibName: "KariyeriniPlanlaCollectionView", bundle: nil)
        collectionView.register(kariyeriniPlanlaCollectionCellNib, forCellWithReuseIdentifier: "KariyeriniPlanlaCollectionViewCell")
    }
    
    
}


extension KariyeriniPlanlaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KariyeriniPlanlaCollectionViewCell", for: indexPath) as? KariyeriniPlanlaCollectionViewCell {
            
            cell.imageView.image = UIImage(named: "kariyeriniPlanla")

               return cell
        }
        return UICollectionViewCell()
    }
    
}
