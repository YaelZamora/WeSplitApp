//
//  ContentView.swift
//  WeSplitApp
//
//  Created by iOS UNAM 18 on 06/06/22.
//

import SwiftUI

struct ContentView: View {
    //@State private var tapCount = 0
    @State private var name = ""
    let estudiantes = ["Yael", "Yema", "Moy", "David"]
    @State private var estudianteSeleccionado = "Yael"
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Sección superior")
                }
                
                Section{
                    Text("Sección abajo 1")
                    Text("Sección abajo 2")
                    TextField("Escribe tu nombre", text: $name)
                    Text("Tu nombre es: \(name)")
                }
                
                Section{
                    Picker("Selecciona a tu alumno:", selection: $estudianteSeleccionado) {
                        ForEach(estudiantes, id: \.self){
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
        /*Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }*/
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
