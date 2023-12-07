//
//  PetViewModel.swift
//  App268
//
//  Created by IGOR on 04/12/2023.
//

import SwiftUI

final class PetViewModel: ObservableObject {

    @AppStorage("pets") var pets: [String] = []
    @Published var name = ""
    @Published var breed = ""
    @Published var years: [String] = ["1 year", "5 year", "10 year"]
    @Published var selectedYear = ""
    @Published var selectedCat = ""
    @Published var categories: [String] = ["S 0-5kg", "M 5-10kg", "L 10kg-more"]

}

