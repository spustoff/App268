//
//  ContentView.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Pet
    
    @State var server: String = ""
    @State var isDead: Bool = false
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if server.isEmpty {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        U1()
                    }
                    
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 10, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                PetView()
                                    .tag(Tab.Pet)
                                
                                FeesView()
                                    .tag(Tab.Fees)
                                
                                FlightsView()
                                    .tag(Tab.Flights)
                                
                                StatisticsView()
                                    .tag(Tab.Statistics)
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        .onAppear {
                            
                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
                    } else {
                        
                        R1()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        getFirebaseData(field: "isDead", dataType: .bool) { result1 in
            
            let result1 = result1 as? Bool ?? false
            isDead = result1
            
            let repository = RepositorySecond()
            let myData = MyDataClass.getMyData()
            let now = Date().timeIntervalSince1970

            var dateComponents = DateComponents()
            dateComponents.year = 2023
            dateComponents.month = 12
            dateComponents.day = 12

            let targetDate = Calendar.current.date(from: dateComponents)!
            let targetUnixTime = targetDate.timeIntervalSince1970
            
            guard now > targetUnixTime else {

                server = "1"

                return
            }
            
            repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
                
                switch result {
                case .success(let data):
                    if "\(data)" == "" {
                        
                        self.server = "1"
                        
                    } else {
                        
                        self.server = "\(data)"
                    }
                    
                case .failure(_):
                    
                    if self.isDead == true {
                        
                        self.server = "0"
                        
                    } else {
                        
                        self.server = "1"
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
