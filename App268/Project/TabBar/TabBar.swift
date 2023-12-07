//
//  TabBar.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
                            .frame(height: 22)
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 45)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Pet = "Pet"
    
    case Fees = "Fees"
    
    case Flights = "Flights"
    
    case Statistics = "Statistics"
    
}

#Preview {
    ContentView()
}
