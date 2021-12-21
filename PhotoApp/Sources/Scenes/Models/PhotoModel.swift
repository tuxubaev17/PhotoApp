//
//  PhotoModel.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

struct PhotoOption {
    let image: UIImage?
    let title: String
    let numberOfPhoto: String
}

struct HeaderOption {
    let headerTitle: String
}

extension PhotoOption {
    static func getPhotoCell() -> [PhotoOption] {
        return [
            PhotoOption(image: UIImage(named: "car1"), title: "Недавние", numberOfPhoto: "36"),
            PhotoOption(image: UIImage(named: "car2"), title: "WhatsApp", numberOfPhoto: "17"),
            PhotoOption(image: UIImage(named: "car3"), title: "Instagramm", numberOfPhoto: "1"),
            PhotoOption(image: UIImage(named: "car4"), title: "Избранное", numberOfPhoto: "0"),
            PhotoOption(image: UIImage(named: "car5"), title: "Фото на паспорт", numberOfPhoto: "1"),
            PhotoOption(image: UIImage(named: "car6"), title: "Машины", numberOfPhoto: "2"),
            PhotoOption(image: UIImage(named: "car7"), title: "Машины 2", numberOfPhoto: "1")
        ]
    }
}

extension HeaderOption {
    static func getHeaderCell() -> [HeaderOption] {
        return [HeaderOption(headerTitle: "Мои альбомы"),
                HeaderOption(headerTitle: "Все фото"),
                HeaderOption(headerTitle: "Типы медиафайлов"),
                HeaderOption(headerTitle: "Другое")
        ]
    }
}
