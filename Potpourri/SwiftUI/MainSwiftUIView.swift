//
//  MainSwiftUIView.swift
//  Potpourri
//
//  Created by Nutan Niraula on 12/6/2565 BE.
//

import SwiftUI

struct MainSwiftUIView: View {
    var body: some View {
        Text("SwiftUI")
        NavigationLink("Draggable View Test") {
            HStack {
                DraggableView()
                DraggableView()
                DraggableView()
            }
        }
    }
}

struct MainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainSwiftUIView()
    }
}
