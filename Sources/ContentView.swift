import SwiftUI

private struct DemoRoute: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let symbol: String
}

struct ContentView: View {
    private let routes = [
        DemoRoute(title: "按钮页", symbol: "button.programmable"),
        DemoRoute(title: "表单页", symbol: "list.bullet.rectangle"),
        DemoRoute(title: "图形页", symbol: "square.on.circle")
    ]

    var body: some View {
        NavigationStack {
            List(routes) { route in
                NavigationLink(value: route) {
                    Label(route.title, systemImage: route.symbol)
                }
            }
            .navigationTitle("NavigationLink")
            .navigationDestination(for: DemoRoute.self) { route in
                VStack(spacing: 12) {
                    Image(systemName: route.symbol)
                        .font(.system(size: 48))
                    Text(route.title)
                        .font(.title2)
                    Text("点列表项即 push 到这里。")
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
    }
}
