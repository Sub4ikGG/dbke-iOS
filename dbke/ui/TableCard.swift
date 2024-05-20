//
//  TableCard.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct TableCard: View {
    let title: String
    let description: String
    let icon: ImageResource
    
    var body: some View {
        HStack {
            Image(icon)
            
            VStack {
                Text(title)
                    .font(.system(size: 25, weight: Font.Weight.regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color(.appBlack))
                
                Text(description)
                    .font(.system(size: 14, weight: Font.Weight.light))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color(.appBlack))
                
            }.padding([.horizontal], 8)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.chevronRight)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
    }
}

#Preview {
    ScrollView {
        Button(action: {}, label: {
            TableCard(
                title: "Clients",
                description: "Client ID, Name, Phone & Address",
                icon: .emojiBusiness
            ).padding()
        })
    }.background(Color.background)
}
