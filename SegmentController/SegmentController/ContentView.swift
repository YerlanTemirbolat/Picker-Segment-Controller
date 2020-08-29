//
//  ContentView.swift
//  SegmentController
//
//  Created by Admin on 8/29/20.
//  Copyright © 2020 Yerlan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var segmentIndex = 0
    @State var offsetX = 0
    var models = ["BMW 3", "BMW 5", "BMW 7"]
    var image = ["m3", "m5", "m7"]
    
    var body: some View {
        VStack {
            Text("Cars - \(models[segmentIndex])")
                .font(.title)
                .padding()
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .padding()
                    .opacity(0.4)
                    .offset(x: CGFloat(offsetX))
                Image(image[segmentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .offset(x: CGFloat(offsetX))
            }
            .animation(.spring())
            
            Picker(selection: Binding(get: {
                self.segmentIndex
            }, set: { newValue in
                self.segmentIndex = newValue
                self.offsetX = -500
                self.moveBack()
            }), label: Text("")) {
                ForEach(0 ..< models.count) {
                    Text(self.models[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
            .frame(height: 150)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.offsetX = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
