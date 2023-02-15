import SwiftUI

struct ContentView: View {
    
    @State var showPizza = false
    @State var showTitle = false
    @State var subtitleOpacity = 0.0
    @State var shouldRotate = true
    @State var shouldFinishRotation = false
    let animation = Animation.linear(duration: 2).repeatForever(autoreverses: false)
    
    var body: some View {
        VStack {
            if showPizza {
                Image(systemName: "triangle")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 100, height: 100)
                    .padding()
                    .transition(.push(from: .trailing))
                    .ignoresSafeArea()
                    .rotationEffect(shouldRotate ? .degrees(0) : .degrees(360))
            }
            
            if showTitle {
                Text("Mike")
                    .font(.title)
                    .transition(.push(from: .leading))
                    .ignoresSafeArea()
            }
            
                Text("The legendary Pizza Yolo")
                .font(.subheadline)
                .opacity(subtitleOpacity)
        }
        .background(.red.opacity(0.3))
        .onAppear {
            
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 10)) { // this is 0.5 seconds
                showPizza = true
            }

            withAnimation(.linear(duration: 1).speed(0.5)) { // this is 2 seconds
                showPizza = true
            }
            
            withAnimation(.linear(duration: 1).delay(1)) {
                showTitle = true
            }
            
            withAnimation(.linear(duration: 1).delay(2)) {
                subtitleOpacity = 1.0
            }
            
            withAnimation(animation.delay(3)) {
                shouldRotate = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
