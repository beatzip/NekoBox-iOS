import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ConfigViewModel()
    @StateObject private var vpn = VPNManager()

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("NekoBox")
                    .font(.largeTitle.bold())

                Button {
                    vpn.toggleVPN()
                } label: {
                    Label(
                        vpn.status == .connected ? "Disconnect" : "Connect",
                        systemImage: vpn.status == .connected ? "stop.circle" : "play.circle"
                    )
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                Text("Status: \(vpn.status.description)")
                    .foregroundColor(.secondary)

                NavigationLink("Logs") {
                    LogsView(logs: $vm.logs)
                }

                Spacer()
            }
            .padding()
            .task {
                vm.generateAndSaveConfig()
            }
        }
    }
}