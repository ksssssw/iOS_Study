//
//  CacheAsyncImage.swift
//  PokedexSwift
//
//  Created by 1000288 on 2023/11/01.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) 
    {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cached = ImageCache[url] {
            let _ = print("cached \(url.absoluteString)")
            content(.success(cached))
        } else {
            let _ = print("request \(url.absoluteString)")
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

fileprivate class ImageCache {
    private static var cache: [URL: Image] = [:]
    private static var recentURLs: [URL] = []

    static subscript(url: URL) -> Image? {
        get {
            return cache[url]
        }
        set {
            if let newImage = newValue {
                cache[url] = newImage
                // 새 URL을 배열의 끝에 추가 (가장 최근 사용됨)
                recentURLs.append(url)
                // 최대 캐시 크기를 설정 (원하는 크기로 조절)
                let maxCacheSize = 100
                // 최대 크기를 초과하면 오래된 항목을 제거
                if recentURLs.count > maxCacheSize {
                    if let removedURL = recentURLs.first {
                        recentURLs.removeFirst()
                        cache[removedURL] = nil
                    }
                }
            } else {
                // 이미지가 nil로 설정되면 해당 URL 제거
                recentURLs.removeAll { $0 == url }
                cache[url] = nil
            }
        }
    }
}
    //#Preview {
    //    CacheAsyncImage(
    //        url:
    //    )
    //}
