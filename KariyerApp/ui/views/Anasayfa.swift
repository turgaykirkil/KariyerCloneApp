//
//  ViewController.swift
//  KariyerApp
//
//  Created by Turgay KIRKIL on 27.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
        setupNavigationBar()
        setupTabBar()
        customNibs()
        
        //tabAnasayfa
        
        if let items = tabBarController?.tabBar.items {
            for (index, item) in items.enumerated() {
                // Özel resimlerin adlarını ve extension'larını doğru bir şekilde belirt
                let imageName: String
                switch index {
                case 0:
                    imageName = "tabAnasayfa"
                case 1:
                    imageName = "tabIslemler"
                case 2:
                    imageName = "tabBildirimler"
                case 3:
                    imageName = "tabProfil"
                default:
                    continue
                }

                if let originalImage = UIImage(named: imageName) {
                    // Boyutları küçültmek için ölçek faktörü belirle
                    let scaleFactor: CGFloat = 0.90 // İstediğin oranı belirle

                    // Resmi küçült
                    let scaledImage = originalImage.scalePreservingAspectRatio(targetSize: CGSize(width: originalImage.size.width * scaleFactor, height: originalImage.size.height * scaleFactor))

                    // Rendering mode'ını belirleyerek UIImage oluştur
                    let tabBarItemImage = scaledImage.withRenderingMode(.alwaysOriginal)

                    // Tab Bar Item'in görüntüsünü güncelle
                    item.image = tabBarItemImage
                    item.selectedImage = tabBarItemImage
                }
            }
        }
        
    }
    
    private func configureData() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func customNibs() {
        let sliderCellNib: UINib = UINib(nibName: "SliderTableView", bundle: nil)
        tableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
        
        let benzerIlanlarCellNib: UINib = UINib(nibName: "BenzerIlanlarTableView", bundle: nil)
        tableView.register(benzerIlanlarCellNib, forCellReuseIdentifier: "BenzerIlanlarTableViewCell")
        
        let kariyeriniPlanlaCellNib: UINib = UINib(nibName: "KariyeriniPlanlaTableView", bundle: nil)
        tableView.register(kariyeriniPlanlaCellNib, forCellReuseIdentifier: "KariyeriniPlanlaTableViewCell")
        
        let kariyerRehberiCellNib: UINib = UINib(nibName: "KariyerRehberiTableView", bundle: nil)
        tableView.register(kariyerRehberiCellNib, forCellReuseIdentifier: "KariyerRehberiTableViewCell")
        
        let ilanOnerileriCellNib: UINib = UINib(nibName: "IlanOnerileriTableView", bundle: nil)
        tableView.register(ilanOnerileriCellNib, forCellReuseIdentifier: "IlanOnerileriTableViewCell")
    }
      
    func changeColor(itemApperance: UITabBarItemAppearance) {
        itemApperance.selected.iconColor = UIColor(named: "purple")
    }
    
    private func setupNavigationBar() {


    }

    private func setupTabBar() {
        let apperance = UITabBarAppearance()
        
        apperance.backgroundColor = .white
        
        changeColor(itemApperance: apperance.stackedLayoutAppearance)
        changeColor(itemApperance: apperance.inlineLayoutAppearance)
        changeColor(itemApperance: apperance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = apperance
        tabBarController?.tabBar.scrollEdgeAppearance = apperance
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as? SliderTableViewCell {
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "BenzerIlanlarTableViewCell", for: indexPath) as? BenzerIlanlarTableViewCell {
                return cell1
            }
        } else if indexPath.section == 2 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "KariyeriniPlanlaTableViewCell", for: indexPath) as? KariyeriniPlanlaTableViewCell {
                return cell2
            }
        } else if indexPath.section == 3 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "KariyerRehberiTableViewCell", for: indexPath) as? KariyerRehberiTableViewCell {
                return cell3
            }
        } else if indexPath.section == 4 {
            if let cell4 = tableView.dequeueReusableCell(withIdentifier: "IlanOnerileriTableViewCell", for: indexPath) as? IlanOnerileriTableViewCell {
                return cell4
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        } else if indexPath.section == 1 {
            return 220
        } else if indexPath.section == 2 {
            return 250
        } else if indexPath.section == 3 {
            return 250
        }
        return 1000
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        let newSize = targetSize
        let widthRatio = newSize.width / size.width
        let heightRatio = newSize.height / size.height

        let ratio = min(widthRatio, heightRatio)
        let scaledSize = CGSize(width: size.width * ratio, height: size.height * ratio)

        UIGraphicsBeginImageContextWithOptions(scaledSize, false, scale)
        draw(in: CGRect(origin: .zero, size: scaledSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? self
    }
}
