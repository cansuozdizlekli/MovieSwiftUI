//
//  SplashScreenView.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/26/24.
//


import SwiftUI

struct SplashScreenView: View {
    @State var isActive = false
    @State private var scale: CGFloat = 0.5
    @State private var opacity = 0.5
    @State private var offsetY: CGFloat = 0

    var body: some View {
        if self.isActive {
            ContentView()
                .transition(.opacity)
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.theme.splashTop, Color.theme.splashBottom]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea(edges: .all)
                
                Image("splash-image")
                    .resizable()
                    .frame(width: 108, height: 184)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(y: offsetY)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            self.scale = 1.2
                            self.opacity = 1.0
                            self.offsetY = -50
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                self.scale = 1.0
                                self.opacity = 0.0
                            }
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}



#Preview {
    SplashScreenView()
}
