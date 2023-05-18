//
//  Library.swift
//  MyMusic
//
//  Created by dzmitry on 17.05.23.
//

import SwiftUI

struct Library: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            print("12345")
                        }, label: {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9,
                                                                      green: 0.1,
                                                                      blue: 0.3,
                                                                      alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9,
                                                                     green: 0.9,
                                                                     blue: 0.9,
                                                                     alpha: 1)))
                                .cornerRadius(10)
                        })
                        Button(action: {
                            print("54321")
                        }, label: {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9,
                                                                      green: 0.1,
                                                                      blue: 0.3,
                                                                      alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9,
                                                                     green: 0.9,
                                                                     blue: 0.9,
                                                                     alpha: 1)))
                                .cornerRadius(10)
                        })
                    }
                }.padding().frame(height: 70)
                Divider().padding(.leading).padding(.trailing)
                List {
                    LibraryCell()
                    Text("Second")
                    Text("Third")
                }
            }
                .navigationBarTitle("Library")
        }
    }
}

struct LibraryCell: View {
    var body: some View {
        HStack {
            Image("Image").resizable().frame(width: 50, height: 50).cornerRadius(2)
            VStack {
                Text("Track Name")
                Text("Artist Name")
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
