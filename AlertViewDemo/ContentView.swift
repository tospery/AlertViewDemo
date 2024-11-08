//
//  ContentView.swift
//  AlertViewDemo
//
//  Created by 杨建祥 on 2024/11/8.
//

import SwiftUI
import AlertToast

struct ContentView: View {
    
    @StateObject private var viewModel = AlertViewModel()
    @State private var isPresentingFullScreen = false
    
     var body: some View {
         NavigationView{
             
             VStack(spacing: 40) {
                 NavigationLink("Move to Second View (same nav)", destination: SecondView().environmentObject(viewModel))
                 Button("Move to Second View (diff nav)") {
                     isPresentingFullScreen = true
                 }
             }
         }
         .fullScreenCover(isPresented: $isPresentingFullScreen) {
             SecondView().environmentObject(viewModel)
         }
         .toast(isPresenting: $viewModel.show){
             viewModel.alertToast
         }
     }
}


class AlertViewModel: ObservableObject {
    
    @Published var show = false
    @Published var alertToast = AlertToast(type: .regular, title: "SOME TITLE"){
        didSet{
            show.toggle()
        }
    }

}
