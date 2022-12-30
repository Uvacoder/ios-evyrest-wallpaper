//
//  OptionsView.swift
//  Evyrest
//
//  Created by sourcelocation on 30/12/2022.
//

import SwiftUI

struct OptionsView: View {
    @AppStorage("cacheLimit") var cacheLimit: Double = 1
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                
            }) {
                ZStack {
                    Image("Background2")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 80)
                        .clipped()
                    Color(hex: "00213A")
                        .opacity(0.3)
                        .clipped()
                    VStack {
                        Text("Current theme")
                            .font(.footnote)
                            .foregroundColor(.white)
                        Text("Nature")
                            .font(.headline)
                    }
                }
                .overlay(alignment: .trailing) {
                    Image(systemName: "chevron.right")
                        .padding(8)
                }
                .cornerRadius(8)
                .frame(height: 80)
            }
            .padding(.horizontal)
            .padding(.top)
            
            VStack(spacing: 8) {
                HStack {
                    Text("Recents")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Clear")
                            .font(.footnote)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 8)
                            .background(MaterialView(.light))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        // put your code for the buttons here
                        let egg: () -> Void = {
                            print("egg")
                        }
                        ForEach(0...10, id: \.self) { n in
                            let isFirst = n == 0 // make sure these are valid or the styling wont work
                            let isLast = n == 10
                            
                            if isFirst || isLast {
                                if isFirst {
                                    Button(action: egg) {
                                        Image("Background2")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70)
                                            .clipped()
                                            .overlay(alignment: .bottom) {
                                                MaterialView(.dark)
                                                    .frame(height: 40)
                                                    .opacity(0.5)
                                                Image(systemName: "square.and.arrow.down")
                                            }
                                            .cornerRadius(8)
                                    }
                                    .padding(.leading)
                                } else {
                                    Button(action: egg) {
                                        Image("Background2")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70)
                                            .clipped()
                                            .overlay(alignment: .bottom) {
                                                MaterialView(.dark)
                                                    .frame(height: 40)
                                                    .opacity(0.5)
                                                Image(systemName: "square.and.arrow.down")
                                            }
                                            .cornerRadius(8)
                                    }
                                    .padding(.trailing)
                                }
                            } else {
                                Button(action: egg) {
                                    Image("Background2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 70)
                                        .clipped()
                                        .overlay(alignment: .bottom) {
                                            MaterialView(.dark)
                                                .frame(height: 40)
                                                .opacity(0.5)
                                            Image(systemName: "square.and.arrow.down")
                                        }
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                }
                .frame(height: 150)
            }
            
            VStack {
                HStack {
                    Text("Cache limit")
                        .font(.headline)
                    Spacer()
                    Text(cacheLimit != 3 ? "\(String(format: "%g", Double(Int(cacheLimit * 10)) / 10.0))GB" : "∞")
                }
                .padding(.horizontal)
                
                Slider(value: $cacheLimit, in: 0.1...3)
                    .tint(.init("BackgroundColor"))
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .foregroundColor(.white)
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(optionsPresented: true)
    }
}