//
//  PhotoModel.swift
//  PhotoApp
//
//  Created by Alikhan Tuxubayev on 21.12.2021.
//

import UIKit

enum PhotoType {
    case albums
    case sharedAlbums
    case typesOfMedia
}

struct Section {
    let options: [PhotoOption]
}

struct PhotoOption {
    let image: UIImage?
    let title: String
    let numberOfPhoto: String
    let type: PhotoType
}

struct HeaderOption {
    let headerTitle: String
}

extension PhotoOption {
    static func getPhotoCell() -> [Section] {
        return [
            Section(options: [
                PhotoOption(image: UIImage(named: "car1"), title: "Недавние", numberOfPhoto: "36", type: .albums),
                PhotoOption(image: UIImage(named: "car2"), title: "WhatsApp", numberOfPhoto: "17", type: .albums),
                PhotoOption(image: UIImage(named: "car3"), title: "Instagramm", numberOfPhoto: "1", type: .albums),
                PhotoOption(image: UIImage(named: "car4"), title: "Избранное", numberOfPhoto: "0", type: .albums),
                PhotoOption(image: UIImage(named: "car5"), title: "Недавние", numberOfPhoto: "36", type: .albums),
                PhotoOption(image: UIImage(named: "car6"), title: "WhatsApp", numberOfPhoto: "17", type: .albums),
                PhotoOption(image: UIImage(named: "car7"), title: "Instagramm", numberOfPhoto: "1", type: .albums),
                PhotoOption(image: UIImage(named: "car8"), title: "Избранное", numberOfPhoto: "0", type: .albums),
            ]),
            Section(options: [
                PhotoOption(image: UIImage(named: "car9"), title: "Фото на паспорт", numberOfPhoto: "1", type: .sharedAlbums),
                PhotoOption(image: UIImage(named: "car10"), title: "Машины", numberOfPhoto: "2", type: .sharedAlbums),
                PhotoOption(image: UIImage(named: "car11"), title: "Машины 2", numberOfPhoto: "1", type: .sharedAlbums),
                PhotoOption(image: UIImage(named: "car12"), title: "Фото на паспорт", numberOfPhoto: "1", type: .sharedAlbums),
                PhotoOption(image: UIImage(named: "car13"), title: "Машины", numberOfPhoto: "2", type: .sharedAlbums),
                PhotoOption(image: UIImage(named: "car14"), title: "Машины 2", numberOfPhoto: "1", type: .sharedAlbums)
            ]),
            Section(options: [
                PhotoOption(image: UIImage(systemName: "video"), title: "Видео", numberOfPhoto: "1", type: .typesOfMedia),
                PhotoOption(image: UIImage(systemName: "person.crop.square"), title: "Селфи", numberOfPhoto: "2", type: .typesOfMedia),
                PhotoOption(image: UIImage(systemName: "livephoto"), title: "Фото Live Photos", numberOfPhoto: "1", type: .typesOfMedia),
            ]),
        ]
    }
}

extension HeaderOption {
    static func getHeaderCell() -> [HeaderOption] {
        return [HeaderOption(headerTitle: "Мои альбомы"),
                HeaderOption(headerTitle: "Общие альбомы"),
                HeaderOption(headerTitle: "Типы медиафайлов"),
//                HeaderOption(headerTitle: "Другое")
        ]
    }
}
