//
//  ContinueButton.swift
//  allwise
//
//  Created by Hugo Peyron on 09/11/2023.
//

import SwiftUI

struct ContinueButton: View {
    
    @State var action : () -> Void
    
    var body: some View {
        
        Button(action: {action()}, label: {
            Text("CONTINUE")
                .fontDesign(.rounded)
                .fontWeight(.black)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 15, maxHeight: 15)
                .padding()
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .padding()
    }
}

#Preview {
    ContinueButton(action: {})
}
