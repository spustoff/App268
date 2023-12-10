//
//  AddFlight.swift
//  App268
//
//  Created by IGOR on 05/12/2023.
//

import SwiftUI

struct AddFlight: View {
    
    @StateObject var viewModel = FlightsViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New flight")
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
                    
                    VStack(spacing: 30) {
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 55, alignment: .leading)
                            
                            Spacer()
                            
                            HStack {

                                DatePicker("Start date", selection: $viewModel.flightDate, in: Date()..., displayedComponents: .date)
                                    .labelsHidden()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                DatePicker("Start date", selection: $viewModel.flightDate, in: Date()..., displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                        
                        HStack {
                            
                            Text("From")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 55, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("")
                                    .foregroundColor(viewModel.flightFrom.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.flightFrom.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flightFrom)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                        
                        HStack {
                            
                            Text("To")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 55, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("")
                                    .foregroundColor(viewModel.flightTo.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.flightTo.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flightTo)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                        
                        HStack {
                            
                            Text("Transfer")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 55, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("")
                                    .foregroundColor(viewModel.flightTransfer.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.flightTransfer.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flightTransfer)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                        
                        HStack {
                            
                            Text("Miles")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(width: 55, alignment: .leading)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("")
                                    .foregroundColor(viewModel.flightMiles.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.flightMiles.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.flightMiles)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.numberPad)
                                
                            })
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                        
                        HStack {
                            
                            Text("Pet")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.pets, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currentPet = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.currentPet == index ? .white : .white.opacity(0)))
                                            
                                        })
                                    }
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                Button(action: {
     
                    viewModel.addFlight(selectedPet: viewModel.currentPet, completion: {
                        
                        viewModel.currentPet = ""
                        viewModel.miles += Int(viewModel.flightMiles) ?? 0
                        viewModel.numberFlight += 1
                    })
                    
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
            }
        }
    }
}

#Preview {
    AddFlight()
}
