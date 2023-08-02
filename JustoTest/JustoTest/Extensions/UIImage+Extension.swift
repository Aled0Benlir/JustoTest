//
//  UIImage+Extension.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import Foundation
import UIKit

extension UIImageView {
    func getImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix("image"),
                  let data = data,
                  error == nil,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func getImage(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        getImage(from: url, contentMode: mode)
    }
}
