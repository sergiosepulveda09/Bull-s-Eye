
import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 20)
                    .frame(width: 200, height:  100)
                    .transition(.opacity)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Button(action: {
                withAnimation {
                    wideShapes.toggle()
                }
            }) {
                Text("animate!")
            }
        }
        .background(Color.green)
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
