//
//  CastView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/14/24.
//

import SwiftUI


struct CastView: View {
    @StateObject var viewModel: CastViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var isCastExtended: Bool // Use Binding<Bool>

    init(movieId: Int, isCastExtended: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: CastViewModel(movieID: movieId))
        self._isCastExtended = isCastExtended
    }
    
    var body: some View {
        VStack {
            if isCastExtended {
                Divider()
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.cast.prefix(isCastExtended ? viewModel.cast.count : 4)) { actor in
                                    CastItemView(actor: actor)
                                            .padding(5)
                            }
                    }
                }
            }.navigationTitle("Cast & Crews")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
            
        }.background(Color.theme.background)
    }
    
}



#Preview {
    CastView(movieId: 33, isCastExtended: .constant(true))
}

extension CastView {
    var backButton : some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(Color.theme.customGray)
            }
       }
   }
}
