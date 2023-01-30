//
//  SecondPageSwiftUIView.swift
//  Skylab
//
//  Created by Сергей Молодец on 30.01.2023.
//

import SwiftUI
import RxSwift

struct SecondPageSwiftUIView: View {
    var viewModel: SecondPageSwiftUIViewModel!
    
    var body: some View {
        VStack {
            Text("Second Page SwiftUI View")
                .font(.title)
            
            Button("Open Second SubController", action: {
//                Binding tap to viewmoedl
                viewModel.openSecondSubControllerDidTap.onNext(())}) // make an empty emit
                .padding()
        }
//        Just for lifecycle info
        .onDisappear {
            print("disappear")
        }
        .onAppear {
            print("appear")
        }
    }
}

struct SecondPageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageSwiftUIView(viewModel: SecondPageSwiftUIViewModel())
    }
}
