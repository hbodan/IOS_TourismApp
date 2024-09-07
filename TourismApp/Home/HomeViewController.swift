//
//  HomeViewController.swift
//  TourismApp
//
//  Created by User-UAM on 9/6/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let topDestinations = [
        ["city": "Granada", "activities": "80 activities", "image": "imagen1"],
        ["city": "León", "activities": "65 activities", "image": "imagen2"],
        ["city": "San Juan del Sur", "activities": "50 activities", "image": "imagen3"],
        ["city": "Ometepe", "activities": "45 activities", "image": "imagen4"]
    ]
    
    let exclusiveHotels = [
        ["hotel": "Mukul Resort", "image": "imagen5"],
        ["hotel": "Morgan's Rock", "image": "imagen6"],
        ["hotel": "Jicaro Island", "image": "imagen7"],
        ["hotel": "Aqua Wellness Resort", "image": "imagen8"]
    ]
    
    let collectionViewTopDestinations: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let collectionViewExclusiveHotels: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .white
        
        let iconStackView = createIconStackView()
        view.addSubview(iconStackView)
    
        let titleLabel = UILabel()
        titleLabel.text = "Where would you spend your holiday?"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let topDestinationsLabel = UILabel()
        topDestinationsLabel.text = "Top Destinations"
        topDestinationsLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        topDestinationsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topDestinationsLabel)
        
        collectionViewTopDestinations.delegate = self
        collectionViewTopDestinations.dataSource = self
        collectionViewTopDestinations.register(DestinationCell.self, forCellWithReuseIdentifier: "DestinationCell")
        view.addSubview(collectionViewTopDestinations)
        
        let exclusiveHotelsLabel = UILabel()
        exclusiveHotelsLabel.text = "Exclusive Hotels"
        exclusiveHotelsLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        exclusiveHotelsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exclusiveHotelsLabel)
        
        collectionViewExclusiveHotels.delegate = self
        collectionViewExclusiveHotels.dataSource = self
        collectionViewExclusiveHotels.register(HotelCell.self, forCellWithReuseIdentifier: "HotelCell")
        view.addSubview(collectionViewExclusiveHotels)
        
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            iconStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            iconStackView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            topDestinationsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            topDestinationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            collectionViewTopDestinations.topAnchor.constraint(equalTo: topDestinationsLabel.bottomAnchor, constant: 10),
            collectionViewTopDestinations.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionViewTopDestinations.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionViewTopDestinations.heightAnchor.constraint(equalToConstant: 150),
            
            exclusiveHotelsLabel.topAnchor.constraint(equalTo: collectionViewTopDestinations.bottomAnchor, constant: 20),
            exclusiveHotelsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            collectionViewExclusiveHotels.topAnchor.constraint(equalTo: exclusiveHotelsLabel.bottomAnchor, constant: 10),
            collectionViewExclusiveHotels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionViewExclusiveHotels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionViewExclusiveHotels.heightAnchor.constraint(equalToConstant: 300) // Ajusta la altura según el contenido
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewTopDestinations {
            return topDestinations.count
        } else {
            return exclusiveHotels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTopDestinations {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DestinationCell", for: indexPath) as! DestinationCell
            let destination = topDestinations[indexPath.item]
            cell.cityLabel.text = destination["city"]
            cell.activitiesLabel.text = destination["activities"]
            cell.imageView.image = UIImage(named: destination["image"]!)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelCell", for: indexPath) as! HotelCell
            let hotel = exclusiveHotels[indexPath.item]
            cell.hotelLabel.text = hotel["hotel"]
            cell.imageView.image = UIImage(named: hotel["image"]!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewTopDestinations {
            return CGSize(width: 200, height: 150)
        } else {
            return CGSize(width: collectionView.bounds.width - 40, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewTopDestinations {
            let destination = topDestinations[indexPath.item]
                    
                    let cityDetailVC = CityDetailViewController()
                    cityDetailVC.cityName = destination["city"]
                    cityDetailVC.cityImageName = destination["image"]
                    cityDetailVC.destinationsCount = destination["activities"]
                    
                    navigationController?.pushViewController(cityDetailVC, animated: true)
        } else {
            let hotel = exclusiveHotels[indexPath.item]["hotel"]
            showAlert(message: "You selected \(hotel!)")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func createIconStackView() -> UIStackView {
        let iconNames = ["airplane", "car", "bus", "train"]
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for iconName in iconNames {
            let iconImageView = UIImageView()
            iconImageView.image = UIImage(systemName: iconName)
            iconImageView.tintColor = .lightGray
            iconImageView.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(iconImageView)
        }
        
        return stackView
    }
}
