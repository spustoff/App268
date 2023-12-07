//
//  FeesView.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

struct FeesView: View {
    
    @State var isS7: Bool = false
    @State var isTurk: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                
                Text("Fees")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 9) {
                        
                        HStack {
                            
                            Image("mplane")
                            
                            Text("S7")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                        }
                        .padding(.vertical, 6)
                        
                        HStack {
                            
                            Text("Rodents")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Cats")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Dogs")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Birds")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Rare animals")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isS7 = true
                        }
                    }
                    
                    VStack(spacing: 9) {
                        
                        HStack {
                            
                            Image("mplane")
                            
                            Text("Turkish Airlines")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                        }
                        .padding(.vertical, 6)
                        
                        HStack {
                            
                            Text("Rodents")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Cats")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Dogs")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Birds")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                            Text("Rare animals")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isTurk = true
                        }
                    }
                }
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color("prim").opacity(isTurk ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isTurk = false
                        }
                    }
                
                VStack(spacing: 9) {
                    
                    Text("Turkish Airlines")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        
                        Text("Turkish Airlines transports only dogs, cats and birds")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text("from 28$")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    }
                    
                    VStack(alignment: .leading, spacing: 9, content: {
                        
                        Text("Weight")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("10 kg in the cabin")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("50 kg in the baggage compartment")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("more Turkish Airlines Cargo services")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.vertical)
                    
                    Text("Other animals are carried as special cargo")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: isTurk ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay (
            
            ZStack {
                
                Color("prim").opacity(isS7 ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isS7 = false
                        }
                    }
                
                VStack(spacing: 9) {
                    
                    Text("S7")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        
                        Text("S7 transports only dogs, cats and birds")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Text("from 28$")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    }
                    
                    VStack(alignment: .leading, spacing: 9, content: {
                        
                        Text("Weight")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("10 kg in the cabin")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("50 kg in the baggage compartment")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("more Turkish Airlines Cargo services")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.vertical)
                    
                    Text("Other animals are carried as special cargo")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: isS7 ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    FeesView()
}
