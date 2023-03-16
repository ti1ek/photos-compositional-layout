//
//  PhotosSections.swift
//  photos-compositional-layout
//
//  Created by Zhuldyz Bukeshova on 16.03.2023.
//

import Foundation

enum SectionType {
    case myAlbumsSection
    case sharedAlbumsSection
    case tableSection
}

struct PhotosSections {
    var type: SectionType
    var header: Header
    var photoAlbum: [PhotoAlbum]
}

extension PhotosSections {
    static var albumSections = [
        PhotosSections(type: .myAlbumsSection,
                       header: Header(title: "My Albums", subtitle: "See All"),
                       photoAlbum: [PhotoAlbum(title: "Recents", image: "1"),
                                    PhotoAlbum(title: "Favourites", image: "2"),
                                    PhotoAlbum(title: "Instagram", image: "3"),
                                    PhotoAlbum(title: "WhatsApp", image: "4"),
                                    PhotoAlbum(title: "Instagram", image: "5"),
                                    PhotoAlbum(title: "Work", image: "6"),
                                    PhotoAlbum(title: "Travel", image: "7")]),
        
        PhotosSections(type: .sharedAlbumsSection,
                       header: Header(title: "Shared Albums", subtitle: "See All"),
                       photoAlbum: [PhotoAlbum(title: "Friends", image: "8"),
                                    PhotoAlbum(title: "Buildings", image: "9"),
                                    PhotoAlbum(title: "New Year", image: "1"),
                                    PhotoAlbum(title: "Street", image: "2"),
                                    PhotoAlbum(title: "Vacation", image: "3")]),
        
        PhotosSections(type: .tableSection,
                       header:  Header(title: "Media Types", subtitle: nil),
                       photoAlbum: [PhotoAlbum(title: "Videos", image: "video"),
                                    PhotoAlbum(title: "Selfies", image: "person.crop.square"),
                                    PhotoAlbum(title: "Live Photos", image: "livephoto"),
                                    PhotoAlbum(title: "Portrait", image: "cube"),
                                    PhotoAlbum(title: "Panoramas", image: "pano"),
                                    PhotoAlbum(title: "Taim-lapse", image: "timelapse"),
                                    PhotoAlbum(title: "Bursts", image: "square.3.layers.3d.down.right")]),
        
        PhotosSections(type: .tableSection,
                       header: Header(title: "Utilities", subtitle: nil),
                       photoAlbum: [PhotoAlbum(title: "Imports", image: "square.and.arrow.down"),
                                    PhotoAlbum(title: "Hidden", image: "eye.slash"),
                                    PhotoAlbum(title: "Recently Deleted", image: "trash")]),
    ]
}
