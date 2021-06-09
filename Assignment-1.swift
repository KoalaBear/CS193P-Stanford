//
//  ContentView.swift
//  CS193P - Memorize (Assignment 1)
//
//  Created by KoalaBear on 29/05/2021.
//

import SwiftUI

let faces = ["😇", "😀", "😁", "🥰", "😌", "🥸", "😎", "🤫", "🐨"]
let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

struct ContentView: View {
    @State var chosenSet = faces.shuffled()
    var body: some View {
        VStack {
            Text("Memorize").bold().font(.largeTitle)
            Spacer()
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
                ForEach(chosenSet, id: \.self) { content in
                    CardView(emoji: content)
                }
            })
            Spacer()
            HStack {
                VStack {
                    Image(systemName: "face.smiling").font(.title)
                    Text("Faces").font(.subheadline)
                }.onTapGesture {
                    chosenSet = faces.shuffled()
                }
                Spacer()
                VStack {
                    Image(systemName: "pencil.and.outline").font(.title)
                    Text("Letters").font(.subheadline)
                }.onTapGesture {
                    chosenSet = letters.shuffled()
                }
            }.padding()
        }.padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}


struct CardView: View {
    var emoji: String
    @State var is_upwards: Bool = false
    var body: some View {
        ZStack {
            if is_upwards {
                RoundedRectangle(cornerRadius: 25.0).scaledToFit().foregroundColor(.green)
                Text(emoji)
            }
            else {
                RoundedRectangle(cornerRadius: 25.0).scaledToFit().foregroundColor(.red)
            }
        }.font(.largeTitle)
        .onTapGesture {
            is_upwards = !is_upwards
        }
    }
}

let bigButtonConfiguration = UIImage.SymbolConfiguration(scale: .medium)











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
