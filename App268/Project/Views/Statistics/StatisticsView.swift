//
//  StatisticsView.swift
//  App268
//
//  Created by IGOR on 05/12/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = FlightsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding()
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 22)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.currentType == index ? .white.opacity(0.2) : .white.opacity(0)))
                            
                        })
                    }
                }
                .frame(height: 22)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                .padding(.horizontal)
                
                if viewModel.currentType == "Miles" {
                    
                    Image("graph")
                        .resizable()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white.opacity(0.1)))
                        .padding()
                        .overlay(
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text("Miles")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text("\(viewModel.miles)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .regular))
                                        .padding(5)
                                        .background(RoundedRectangle(cornerRadius: 18).fill(.white.opacity(0.2)))
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                                .padding(32)
                        )
                    
                    if !viewModel.flights.isEmpty {
                        
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
                                    }
                                    .padding(.bottom, 9)
                                }
                            }
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 40).fill(.white.opacity(0.1)))
                        .padding(.horizontal)
                    }
                    
                } else {
                    
                    Image("graph2")
                        .resizable()
                        .padding()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            HStack {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text("2023")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("\(viewModel.numberFlight)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                            .padding(8)
                                            .background(Circle().fill(.white.opacity(0.2)))
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image("chevron")
                                    }
                                }
                                .padding()
                                .frame(height: 150)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                .padding(.leading)
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text("2022")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("0")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                            .padding(8)
                                            .background(Circle().fill(.white.opacity(0.2)))
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image("chevron")
                                    }
                                }
                                .padding()
                                .frame(height: 150)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchFlights()
        }
    }
}

#Preview {
    StatisticsView()
}
