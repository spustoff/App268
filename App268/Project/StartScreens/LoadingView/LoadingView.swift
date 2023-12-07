//
//  LoadingView.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("lv")
            
            ZStack {
                
                Image("LLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                VStack {
                    
                    Spacer()
                    
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
