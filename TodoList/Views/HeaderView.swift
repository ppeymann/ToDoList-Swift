//
//  HeaderView.swift
//  TodoList
//
//  Created by peyman on 10/27/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let rotate: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: rotate))
                
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3 , height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "title", subTitle: "subTitle", rotate: 15, background: .blue)
}
