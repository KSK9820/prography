//
//  photoDetailViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/02/02.
//

import SwiftUI
import Combine

@Observable
final class PhotoDetailViewModel {
    private let httpService: HTTPServicable = HTTPService()
    
    private var cancellables = Set<AnyCancellable>()
    private var photo: PhotoDTO?
    
    private let id: String
    
    init(id: String) {
        self.id = id
    }

    
    var userName: String? {
        return photo?.user?.userName ?? nil
    }
    var title: String? {
        return photo?.currentUserCollections?.first?.title ?? nil
    }
    var photoDescritpion: String? {
        return photo?.description ?? nil
    }
    var photoTags: String {
        if let tags = photo?.tags {
            return "\n# \(String(describing: tags.map { $0.title }.joined(separator: " # ")))"
        }
        return "\n"
    }
    var photoURL: URL? {
        return URL(string: photo?.urls.full ?? String())
    }
    var photoHeight: CGFloat {
        if let photoHeight = photo?.height,
           let photoWidth = photo?.width {
            return CGFloat(photoWidth / Int(screenWidth) * photoHeight)
        }
        return 0
    }
    
    func dismissView(presentationMode: Binding<PresentationMode>) {
        presentationMode.wrappedValue.dismiss()
    }
    
    func getaPhoto() {
        httpService.request(for: UnsplashRequest.photoDetail(id: id), type: PhotoDTO.self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] data in
                self?.photo = data
            }
            .store(in: &cancellables)
    }
}
