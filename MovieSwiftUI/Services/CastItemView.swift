//
//  CastItemView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/14/24.
//

import SwiftUI

struct CastItemView: View {
    let actor: Cast
    
    @StateObject var viewModel = CastItemViewModel()
    
    var body: some View {
        
        HStack {
            AsyncImage(
                url: viewModel.imageURL(forPosterPath: actor.profilePath ?? ""),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(.infinity)
                        .padding(.leading, 15)
                },
                placeholder: {
                    Image("person")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(.infinity)
                        .padding(.leading, 15)
                }
            )

            
            Text(actor.name ?? "")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.leading,3)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .foregroundColor(Color.theme.secondaryText)
                .opacity(0.5)
            
            
            
            Text(actor.character?.uppercased() ?? "")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(width: UIScreen.main.bounds.width / 2.9, alignment: .leading)
                .lineLimit(1)
                .padding(.leading,4)
                .foregroundColor(Color.theme.secondaryText)
                .opacity(0.5)
                .fontWeight(.bold)
        }.frame(width: UIScreen.main.bounds.width,height: 50)
            .background(Color.theme.background)
    }
    
}

struct CastItemView_Previews: PreviewProvider {
    static var previews: some View {
        CastItemView(actor: Cast(adult: false, gender: 2, id: 190, name: "Clint Eastwood", originalName: "Clint Eastwood", popularity: 92.586, profilePath: "/dU35NnjZ4aGw5abIJe3WXVf3Eey.jpg", castID: 4, character: "William Munny", creditID:"52fe4211c3a36847f8001447", order: 0, job: ""))
    }
}
