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
                // MARK: - Binding tap to viewModel, make an empty emit
                viewModel.openSecondSubControllerDidTap.onNext(())})
            .padding()
        }
    }
}

struct SecondPageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageSwiftUIView(viewModel: SecondPageSwiftUIViewModel())
    }
}
