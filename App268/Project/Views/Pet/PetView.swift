//
//  PetView.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

struct PetView: View {
    
    @StateObject var viewModel = PetViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Pet")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddPetView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 20, weight: .medium))
                        })
                    }
                }
                .padding()
                
                if viewModel.pets.isEmpty {
                    
                    VStack {
                        
                        Text("No pets")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Add your pet's details and save time on flights")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        NavigationLink(destination: {
                            
                            AddPetView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image("button")

                        })
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            ForEach(viewModel.pets, id: \.self) {index in
                                
                                HStack {
                                    
                                    Image("lapa")
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 45).stroke(.white))
                                        .padding()
                                    
                                    VStack {
                                        
                                        Text("S 0-5kg")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            Image("chevron")
                                        }
                                    }
                                    .padding(8)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color("bg3")))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Image("airplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

#Preview {
    PetView()
}
