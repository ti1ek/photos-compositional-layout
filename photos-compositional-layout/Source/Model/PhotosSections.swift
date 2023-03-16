//
//  PhotosSections.swift
//  photos-compositional-layout
//
//  Created by Zhuldyz Bukeshova on 16.03.2023.
//

import Foundation

enum SectionType {
    case myAlbomsSection
    case sharedAlbomsSection
    case tableSection
}

struct PhotosSections {
    var type: SectionType
    var header: Header
    var photoAlbom: [PhotoAlbum]
}

extension PhotosSections {
    static var albumSections = [
        // My Alboms
        PhotosSections(type: .myAlbomsSection,
                       header: Header(title: "Мои альбомы", subtitle: "Все"),
                       photoAlbom: [PhotoAlbum(title: "Недавние", image: "1"),
                                    PhotoAlbum(title: "Избранное", image: "2"),
                                    PhotoAlbum(title: "Instagram", image: "3"),
                                    PhotoAlbum(title: "VSCO", image: "4"),
                                    PhotoAlbum(title: "Lightroom", image: "5"),
                                    PhotoAlbum(title: "RAW", image: "6"),
                                    PhotoAlbum(title: "InShot", image: "7")]),
        
        // Shared Alboms
        PhotosSections(type: .sharedAlbomsSection,
                       header: Header(title: "Общие альбомы", subtitle: "Все"),
                       photoAlbom: [PhotoAlbum(title: "Krawow", image: "8"),
                                    PhotoAlbum(title: "Montenegro", image: "9"),
                                    PhotoAlbum(title: "New Year", image: "1"),
                                    PhotoAlbum(title: "Berlin", image: "2"),
                                    PhotoAlbum(title: "День Рождения", image: "3")]),
        
        // Media Types
        PhotosSections(type: .tableSection,
                       header:  Header(title: "Типы медиафайлов", subtitle: nil),
                       photoAlbom: [PhotoAlbum(title: "Видео", image: "video"),
                                    PhotoAlbum(title: "Селфи", image: "person.crop.square"),
                                    PhotoAlbum(title: "Фото Live Photos", image: "livephoto"),
                                    PhotoAlbum(title: "Портреты", image: "cube"),
                                    PhotoAlbum(title: "Панорамы", image: "pano"),
                                    PhotoAlbum(title: "Таймлапс", image: "timelapse"),
                                    PhotoAlbum(title: "Серии", image: "square.3.layers.3d.down.right")]),
        
        // Utilites
        PhotosSections(type: .tableSection,
                       header: Header(title: "Другое", subtitle: nil),
                       photoAlbom: [PhotoAlbum(title: "Импортированные", image: "square.and.arrow.down"),
                                    PhotoAlbum(title: "Скрытые", image: "eye.slash"),
                                    PhotoAlbum(title: "Недавно удаленные", image: "trash")]),
    ]
}
