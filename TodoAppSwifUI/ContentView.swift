//
//  ContentView.swift
//  TodoAppSwifUI
//
//  Created by Nguyễn Trường Thịnh on 27/07/2021.
//

import SwiftUI

struct Todo {
    let name: String
    let category: String
}

struct ContentView: View {
    @State private var todos = [
        Todo(name: "Write SwiftUI App", category: "work"),
        Todo(name: "Read Bible", category: "personal"),
        Todo(name: "Bring kids out to play", category: "family"),
        Todo(name: "Fetch Wife", category: "family"),
        Todo(name: "Call Mum", category: "family")
    ]
    
    var body: some View {
        List{
            ForEach(todos, id:\.name) {(todo) in
                HStack {
                    Image(todo.category).resizable().frame(width: 50, height: 50)
                    Text(todo.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone SE (2nd generation)")
    }
}
