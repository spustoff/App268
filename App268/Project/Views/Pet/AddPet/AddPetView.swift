//
//  AddPetView.swift
//  App268
//
//  Created by IGOR on 05/12/2023.
//

import SwiftUI

struct AddPetView: View {
    
    @StateObject var viewModel = PetViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Pet")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                        })
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                
                Image("lapa")
                    .frame(width: 110, height: 110)
                    .background(RoundedRectangle(cornerRadius: 45).stroke(.white))
                    .padding()
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Name")
                        .foregroundColor(viewModel.name.isEmpty ? .gray : .white)
                        .font(.system(size: 13, weight: .medium))
                        .opacity(viewModel.name.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.name)
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .medium))
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding()
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Breed")
                        .foregroundColor(viewModel.breed.isEmpty ? .gray : .white)
                        .font(.system(size: 13, weight: .medium))
                        .opacity(viewModel.breed.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.breed)
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .medium))
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding(.horizontal)
                
                HStack {
                    
                    ForEach(viewModel.years, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.selectedYear = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                .background(RoundedRectangle(cornerRadius: 20).stroke(viewModel.selectedYear == index ? .white : .white.opacity(0)))
                                .frame(maxWidth: .infinity)
                            
                        })
                    }
                }
                .padding()
                
                Text("Select an age category for your pet")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                HStack {
                    
                    ForEach(viewModel.categories, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.selectedCat = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                .background(RoundedRectangle(cornerRadius: 20).stroke(viewModel.selectedCat == index ? .white : .white.opacity(0)))                     .frame(maxWidth: .infinity)
                            
                        })
                    }
                }
                .padding()
                
                Text("Choose a weight category for your pet")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
            }
                                
                Button(action: {
                    
                    viewModel.pets.append(viewModel.name)
                    viewModel.name = ""
                    viewModel.breed = ""
                    viewModel.selectedYear = ""
                    viewModel.selectedCat = ""
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.breed.isEmpty || viewModel.selectedYear.isEmpty || viewModel.selectedCat.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.breed.isEmpty || viewModel.selectedYear.isEmpty || viewModel.selectedCat.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddPetView()
}
