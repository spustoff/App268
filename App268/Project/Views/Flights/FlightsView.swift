//
//  FlightsView.swift
//  App268
//
//  Created by IGOR on 05/12/2023.
//

import SwiftUI

struct FlightsView: View {
    
    @StateObject var viewModel = FlightsViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Flights")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddFlight()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 20, weight: .medium))
                        })
                    }
                }
                .padding()
                
                if viewModel.flights.isEmpty {
                    
                    VStack {
                        
                        Text("No flights")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Add flights with your pet")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        NavigationLink(destination: {
                            
                            AddFlight()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image("button")

                        })
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(alignment: .leading, spacing: 20) {
                            
                            ForEach(viewModel.flights, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    HStack {
                                        
                                        Text((index.flightDate ?? Date()).convertDate(format: "MMM d"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                      
                                        
                                        Text((index.flightTime ?? Date()).convertDate(format: "HH : mm"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Image("lapa")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                        
                                        Text(index.selectedPet ?? "Pet")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                        
                                        Spacer()
                                        
                                        Text("M")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(4)
                                            .background(Circle().stroke(.white))
                                        
                                        Text(index.flightMiles ?? "0")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(5)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.2)))
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.flightFrom ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text(">")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text(index.flightTo ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                    }
                                }
                                .padding(20)
                                .background(RoundedRectangle(cornerRadius: 40).fill(.white.opacity(0.1)))
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
        .onAppear {
            
            viewModel.fetchFlights()
        }
    }
}

#Preview {
    FlightsView()
}
