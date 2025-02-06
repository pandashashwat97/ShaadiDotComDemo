//
//  CardView.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 05/02/25.
//

import SwiftUI

struct CardView: View {
    
    var result: Profiles
    
    private var imageUrl: String {
        result.picture.large
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)){ result in
                result.image?
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(Color.black)
                    }
            }
            .frame(width: cardWidth)
            UserInfoView(result: result)
        }
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.5
    }
}
