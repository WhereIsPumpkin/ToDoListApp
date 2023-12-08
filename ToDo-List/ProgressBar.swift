//
//  ProgressBar.swift
//  ToDo-List
//
//  Created by Saba Gogrichiani on 08.12.23.
//

import SwiftUI

struct ProgressBar: View {
    
    var percent: CGFloat = 50
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let multiplier = width / 100
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: width, height: 18)
                    .foregroundStyle(Color(red: 186/255, green: 131/255, blue: 222/255, opacity: 0.41))
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: multiplier * percent, height: 18)
                    .background(Color(red: 186/255, green: 131/255, blue: 222/255).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)))
                    .foregroundStyle(.clear)
            }
        }
    }
}

#Preview() {
    ProgressBar()
}
