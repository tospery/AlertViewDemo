//
//  SecondView.swift
//  AlertViewDemo
//
//  Created by 杨建祥 on 2024/11/8.
//

import SwiftUI
import AlertToast

struct SecondView: View{
    
    @EnvironmentObject var viewModel: AlertViewModel
    
    var body: some View{
        VStack{
            
             //Presenting alert from ObservableObject
            Button("Show Alert"){
                viewModel.show.toggle()
            }
            
            //You can also change the alert type, present
            //a different one and show (because of didSet)
            Button("Change Alert Type"){
                viewModel.alertToast = AlertToast(type: .complete(.green), title: "Completed!", subTitle: nil)
            }
        }
    }
    
}
