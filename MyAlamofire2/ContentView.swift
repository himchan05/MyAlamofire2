//
//  ContentView.swift
//  MyAlamofire2
//
//  Created by 박힘찬 on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var randomjokes = ViewModel()
    
    var body: some View {
        
        NavigationView {
            List(randomjokes.viewmodel, id: \.self) { data in
                Text(data.joke)
            }
            .navigationTitle("\(randomjokes.viewmodel.count)개 입니다.")
            .navigationBarItems(trailing: Button(action: {
                randomjokes.fetchData(count: 45)
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
