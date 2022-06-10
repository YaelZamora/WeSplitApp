//
//  VistaPrincipal.swift
//  WeSplitApp
//
//  Created by iOS UNAM 18 on 06/06/22.
//

import SwiftUI

struct VistaPrincipal: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPorPersona: Double {
        let personasTotales = Double(numberOfPeople + 2)
        let propina = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * propina
        let total = checkAmount + tipValue
        let costoPorPersona = total / personasTotales
        
        return costoPorPersona
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Costo", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "MXN"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Número de personas", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{ //Les preguntamos como podemos hacer para que el tema de la propina se entienda
                    Picker("Porcentaje de propina", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("¿Cuánta propina quieres dejar?")
                }
                
                Section{
                    Text(totalPorPersona, format: .currency(code: Locale.current.currencyCode ?? "MXN"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct VistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        VistaPrincipal()
    }
}
