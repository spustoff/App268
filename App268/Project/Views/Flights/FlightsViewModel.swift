//
//  FlightsViewModel.swift
//  App268
//
//  Created by IGOR on 05/12/2023.
//

import SwiftUI
import Alamofire
import CoreData

final class FlightsViewModel: ObservableObject {
    
    @Published var types: [String] = ["Miles", "Flights"]
    @Published var currentType = "Miles"
    
    @AppStorage("miles") var miles: Int = 0
    @AppStorage("numberFlight") var numberFlight: Int = 0
 
    @AppStorage("pets") var pets: [String] = []
    @Published var flightDate: Date = Date()
    @Published var flightTime: Date = Date()
    @Published var flightTo = ""
    @Published var flightFrom = ""
    @Published var flightTransfer = ""
    @Published var flightMiles = ""
    @Published var flights: [FlightModel] = []
    @AppStorage("currentPet") var currentPet = ""
    
    
    func addFlight(selectedPet: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "FlightModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "FlightModel", into: context) as! FlightModel
        
        sub.flightFrom = flightFrom
//        sub.subPrice = Int16(Int(subPrice) ?? 0)
        sub.flightMiles = flightMiles
        sub.flightTo = flightTo
        sub.flightTransfer = flightTransfer
        sub.flightDate = flightDate
        sub.flightTime = flightTime
        sub.flightTransfer = flightTransfer
        sub.selectedPet = selectedPet
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchFlights() {
        
        CoreDataStack.shared.modelName = "FlightModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FlightModel>(entityName: "FlightModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.flights = branch
//            self.subscriptions = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.flights = []
        }
    }
}
