//
//  MetaballMorphableView.swift
//  Potpourri
//
//  Created by Nutan Niraula on 3/7/2565 BE.
//

import SwiftUI

struct MetaballMorphableView: View {
    @State
    var yPos: Double = 0.85
    
    @State
    var threshold: Double = 0.5
    
    @State
    var radius: Double = 60
    
    @State
    var isCircle: Bool = true
    
    @State
    var timeline: Double = 0.01
    
    @State
    var timeline2: Double = 1.0
    
    var body: some View {
        VStack(alignment: .leading) {
            TimelineView(.animation) { timelineCtx in
                
                //                let now = timelineCtx.date.timeIntervalSinceReferenceDate
                //                let x = (0.5 + now.remainder(dividingBy: 1)) //* 10
                //
                Text("timeline   = \(timeline)").frame(width:250)
                //                Text("x     = \(x)").frame(width:250)
                
                Color.pink.mask {
                    Canvas { ctx, size in
                        
                        ctx.addFilter(.alphaThreshold(min: threshold))
                        
                        if timeline < 0.5 {
                            ctx.addFilter(.blur(radius: timeline * radius))
                        }
                        
                        if timeline >= 0.5 {
                            ctx.addFilter(.blur(radius: (1 - timeline) * radius))
                        }
                        
                        // This drawing operation needs to happen on a separate layer
                        // for the effect to work.
                        ctx.drawLayer { ctx in
                            let rect = CGRect(
                                x: 10 + 75 - (75 * (1 - timeline)),
                                y: 50 + 75 - (75 * (1 - timeline)),
                                width: 150 * (1-timeline),
                                height: 150 * (1-timeline)
                            )
                            
                            if timeline < 0.5 {
                                ctx.draw(Image(systemName: "bell.fill"), in: rect, style: FillStyle.init())
                            }
                            
                            let rect2 = CGRect(
                                x: 10 + 75 - (75 * max(timeline, 0.5)),
                                y: 50 + 75 - (75 * max(timeline, 0.5)),
                                width: 150 * max(timeline, 0.5),
                                height: 150 * max(timeline, 0.5)
                            )
                            
                            
                            if isCircle {
                                if timeline >= 0.5 {
                                    ctx.draw(Image(systemName: "sun.min.fill"), in: rect2, style: FillStyle.init())
                                }
                            }
                        }
                    }
                }
            }
            
            Group {
                Text("timeline")
                Slider(value: $timeline, in: 0.01 ... 1)
                
                Slider(value: $timeline2, in: 0.01 ... 1)
                
                Text("y-Position")
                Slider(value: $yPos)
                
                Text("Threshold")
                Slider(value: $threshold, in: 0.01 ... 0.99)
                
                Text("Radius")
                Slider(value: $radius, in: 0 ... 30)
                
                Button("toggle") {
                    isCircle.toggle()
                }
            }
            
        }
        .padding()
        .font(.caption2)
    }
}

struct MetaballMorphableView_Previews: PreviewProvider {
    static var previews: some View {
        MetaballMorphableView()
    }
}
