//
//  DraggableView.swift
//  Potpourri
//
//  Created by Nutan Niraula on 12/6/2565 BE.
//

import SwiftUI

struct DraggableView: View {
    var color = Color(
        red: .random (in: 0...1),
        green: .random (in: 0...1),
        blue: . random (in: 0...1)
    )
    
    @State private var dragOffset: CGSize = .zero
    @State private var position: CGSize = .zero
    @State private var currentRotation: Angle = .zero
    @GestureState private var twistAngle: Angle = .zero
    @State private var currentMagnification: CGFloat = 1
    @GestureState private var pinchMagnification: CGFloat = 1
    
    public var body: some View {
        let rotationGesture = RotationGesture (minimumAngleDelta: .degrees(0) )
            .updating($twistAngle, body: { (value, state, _) in
                state = value
            })
            .onEnded { self.currentRotation += $0 }
        let dragGesture = DragGesture()
            .onChanged ( { (value) in
                self.dragOffset = value.translation
            })
            .onEnded ({ (value) in
                self.position.width += value.translation.width
                self.position.height += value.translation.height
                self.dragOffset = .zero
            })
        let scaleGesture = MagnificationGesture()
            .updating($pinchMagnification, body: { (value, state, _) in
                state = value
            })
            .onEnded{ self.currentMagnification *= $0 }
        
        
        let gestures = rotationGesture
            .simultaneously(with: dragGesture)
            .simultaneously(with: scaleGesture)
        
        RoundedRectangle( cornerRadius: 10)
            .foregroundColor(color)
            .frame (width: 100, height: 100)
            .rotationEffect (currentRotation + twistAngle)
            .scaleEffect(currentMagnification * pinchMagnification)
            .offset(x: dragOffset.width + position.width, y: dragOffset.height +
                    position.height)
            .gesture(gestures, including: .gesture)
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            DraggableView()
            DraggableView()
            DraggableView()
        }
    }
}

