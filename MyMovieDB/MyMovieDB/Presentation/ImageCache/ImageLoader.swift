//
//  ImageLoader.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 10.10.22.
//

import Foundation
import Combine
import UIKit

final class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: URL
    private var cache: ImageCache?
    private var cancellable: AnyCancellable?
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        
        // first I look inside the cache if I already have something...
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        // if not, download and save it to the cache
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(
                //receiveSubscription: { [weak self] _ in self?.onStart() },
                receiveOutput: { [weak self] in self?.cache($0) })
                //receiveCompletion: { [weak self] _ in self?.onFinish() },
                //receiveCancel: { [weak self] in self?.onFinish() })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
