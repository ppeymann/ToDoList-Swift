//
//  TLButtonView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let bgColor: Color
    let textColor: Color
    let action: () -> Void

    
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundColor(textColor)
                    .bold()
                
            }
            
        }
    }
}

#Preview {
    TLButtonView(title: "title", bgColor: .green, textColor: .white){
        // Action
    }
}
