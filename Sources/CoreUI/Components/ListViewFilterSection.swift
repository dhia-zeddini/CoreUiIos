//
//  ListViewFilterSection.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 15/4/2025.
//

import SwiftUI

/// `ListViewFilterSection` provides a configurable filter section for list views.
///
/// This view displays a search bar that can be toggled on and off, an optional header view,
/// and a horizontal scrollable list of filter buttons. The filter buttons are configurable
/// via an optional array of `FilterButtonModel`. You can easily modify or extend the available
/// filters by providing different models.
///
/// - Parameters:
///   - selectedFilterItem: A binding to the selected filter item, which can be used to filter the list.
///   - searchText: A binding to the search text entered by the user.
///   - withSearch: A Boolean flag that toggles the search bar’s availability.
///   - withHorizontalFilter: A Boolean flag indicating whether to show the horizontal filter buttons.
///   - header: An optional closure that returns a custom header view (type-erased as `AnyView`).
///   - filterButtons: An optional array of `FilterButtonModel` that determines which filter buttons to display.
public struct ListViewFilterSection: View {
    @State var showSearchBar: Bool = false
    private var selectedFilterItem: Binding<String>?
    @Binding var searchText: String
    let withSearch: Bool
    let withHorizontalFilter: Bool
    @ViewBuilder let header: () -> AnyView
    let filterButtons: [FilterButtonModel]?

    public init(
        selectedFilterItem: Binding<String>? = nil,
        searchText: Binding<String>,
        withSearch: Bool = true,
        withVerticalFilter: Bool = false,
        filterButtons: [FilterButtonModel]? = nil,
        @ViewBuilder header: @escaping () -> AnyView = { AnyView(EmptyView()) }
    ) {
        self.selectedFilterItem = selectedFilterItem
        self._searchText = searchText
        self.withSearch = withSearch
        self.withHorizontalFilter = withVerticalFilter
        self.header = header
        self.filterButtons = filterButtons
    }

    public var body: some View {
        VStack {
            HStack(spacing: 10) {
                searchField
                Spacer(minLength: 0)
                if !showSearchBar {
                    header()
                }
            }
            if !showSearchBar && withHorizontalFilter,
                let filterButtons = filterButtons,
               selectedFilterItem != nil
            {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(filterButtons) { button in
                            FilterButton(
                                title: button.title,
                                systemName: button.systemName,
                                color: button.color,
                                selectedFilterItem: selectedFilterItem!
                            )
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
    }

    /// A search field with an animated toggle button.
    ///
    /// When the search button is tapped, the search text field is shown or hidden.
    private var searchField: some View {
        HStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    showSearchBar.toggle()
                    searchText = ""
                }
            }) {
                Image(systemName: showSearchBar ? "xmark" : "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.primaryColor)
            }
            if showSearchBar {
                TextField("Recherche", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }
}

/// `FilterButton` displays a single filter button that updates the selected status when tapped.
///
/// The button shows an icon (system image) and a title. When the button is pressed,
/// its title is assigned to the bound `selectedFilterItem`.
private struct FilterButton: View {
    let title: String
    let systemName: String?
    let color: Color?
    @Binding var selectedFilterItem: String

    var body: some View {
        Button(action: {
            selectedFilterItem = title
        }) {
            HStack {
                if let icon = systemName,
                    let color = color
                {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(color)
                }
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black)
            }
        }
        .frame(height: 30)
        .padding(paddingS)
        .background(
            selectedFilterItem == title ? Color.gray.opacity(0.2) : Color.white
        )
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
