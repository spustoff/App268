//
//  R2.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Find out the rates")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("All airline fares for pet transportation")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        
                        Circle()
                            .fill(.white.opacity(0.4))
                            .frame(width: 10, height: 10)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 10, height: 10)
                        
                        Circle()
                            .fill(.white.opacity(0.4))
                            .frame(width: 10, height: 10)
                    }
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            .padding()
                    })
                }
                .padding()
                .frame(height: UIScreen.main.bounds.height / 2.7)
                .background(Color("bg").ignoresSafeArea())
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    R2()
}
