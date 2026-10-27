import SwiftUI

/// The element list. On iPhone this is a single-column list; on
/// iPad `NavigationSplitView` shows the list beside the detail,
/// which is the SwiftUI equivalent of v1's table-plus-detail
/// storyboard layout.
struct ContentView: View {
    @State private var viewModel = ElementViewModel()
    @State private var selection: Element?

    var body: some View {
        NavigationSplitView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading elements…")
                } else if let error = viewModel.loadError {
                    ContentUnavailableView {
                        Label("Could not load elements", systemImage: "exclamationmark.triangle")
                    } description: {
                        Text(error.localizedDescription)
                    } actions: {
                        Button("Retry") {
                            Task { await viewModel.retry() }
                        }
                    }
                } else if viewModel.filteredElements.isEmpty {
                    ContentUnavailableView.search
                } else {
                    List(viewModel.filteredElements, selection: $selection) { element in
                        NavigationLink(value: element) {
                            HStack {
                                Text(element.symbol)
                                    .font(.headline)
                                    .frame(width: 44, alignment: .leading)
                                Text(element.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Radioactive Elements")
            .searchable(text: $viewModel.searchText)
            .task {
                await viewModel.load()
            }
        } detail: {
            if let selection {
                ElementDetailView(element: selection)
            } else {
                ContentUnavailableView(
                    "Select an element",
                    systemImage: "atom",
                    description: Text("Choose a row to see its atomic data and discovery notes.")
                )
            }
        }
    }
}
