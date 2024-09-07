//
//  CityDetailViewController.swift
//  TourismApp
//
//  Created by User-UAM on 9/6/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    var cityName: String?
    var cityImageName: String?
    var destinationsCount: String?

    private let cityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let destinationsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bookNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reserva ahora", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bookNowTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(cityImageView)
        view.addSubview(cityNameLabel)
        view.addSubview(destinationsLabel)
        view.addSubview(bookNowButton)

        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cityImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cityImageView.heightAnchor.constraint(equalToConstant: 200),

            cityNameLabel.topAnchor.constraint(equalTo: cityImageView.bottomAnchor, constant: 20),
            cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            destinationsLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10),
            destinationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            destinationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            bookNowButton.topAnchor.constraint(equalTo: destinationsLabel.bottomAnchor, constant: 30),
            bookNowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bookNowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bookNowButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        
        cityImageView.image = UIImage(named: cityImageName ?? "")
        cityNameLabel.text = cityName
        destinationsLabel.text = destinationsCount
    }

    @objc private func bookNowTapped() {
        let alert = UIAlertController(title: nil, message: "Módulo aún sin terminar.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
