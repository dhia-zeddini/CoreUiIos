//
//  ListViewFilterSection.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 15/4/2025.
//

import SwiftUI

/// `ListViewFilterSection` provides a configurable filter section for list views.
///
/// This view displays a search bar that can be toggled on and off, an optional pickerFilter view,
/// and a horizontal scrollable list of filter buttons. The filter buttons are configurable
/// via an optional array of `FilterButtonModel`. You can easily modify or extend the available
/// filters by providing different models.
///
/// - Parameters:
///   - selectedFilterItem: A binding to the selected filter item, which can be used to filter the list.
///   - searchText: A binding to the search text entered by the user.
///   - withSearch: A Boolean flag that toggles the search bar’s availability.
///   - withHorizontalFilter: A Boolean flag indicating whether to show the horizontal filter buttons.
///   - pickerFilter: An optional closure that returns a custom pickerFilter view (type-erased as `AnyView`).
///   - filterButtons: An optional array of `FilterButtonModel` that determines which filter buttons to display.
///   - onSearchEditEnd: Action when search editing ends.
///   - onSearchChanged: Action on search text change.
public struct ListViewFilterSection: View {
    @State var showFilterSection: Bool = false
    
    var selectedFilterItem: Binding<String>?
    @Binding var searchText: String
    let withSearch: Bool
    let withHorizontalFilter: Bool
    @ViewBuilder let pickerFilter: () -> AnyView
    let filterButtons: [FilterButtonModel]?
    
    var onSearchEditEnd: () -> Void
    var onSearchChanged: () -> Void
    public init(
        selectedFilterItem: Binding<String>? = nil,
        searchText: Binding<String>,
        withSearch: Bool = true,
        withVerticalFilter: Bool = false,
        filterButtons: [FilterButtonModel]? = nil,
        onSearchEditEnd: @escaping () -> Void = {},
        onSearchChanged: @escaping () -> Void = {},
        @ViewBuilder pickerFilter: @escaping () -> AnyView = {
            AnyView(EmptyView())
        }
    ) {
        self.selectedFilterItem = selectedFilterItem
        self._searchText = searchText
        self.withSearch = withSearch
        self.withHorizontalFilter = withVerticalFilter
        self.pickerFilter = pickerFilter
        self.onSearchEditEnd = onSearchEditEnd
        self.onSearchChanged = onSearchChanged
        self.filterButtons = filterButtons
    }
    
    public var body: some View {
        VStack {
            HStack() {
                if !showFilterSection && withSearch{
                    SearchBar(
                        searchText: $searchText, hint: "Recherche", font:.body, radius: 0,
                        shadowColor: .white,onEndEditing: onSearchEditEnd,onChange: onSearchChanged)
                }else{
                     Spacer()
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showFilterSection.toggle()
                    }
                }) {
                    Image(
                        systemName: showFilterSection
                        ? "xmark" : "slider.horizontal.3"
                    )
                    .font(.title2)
                    .padding()
                }
            }
            .background(.white)
            .cornerRadius(showFilterSection ? 0 : 10)
            .shadow(color:.secondary,radius: showFilterSection ? 0 : 3)
                
            if showFilterSection {
                pickerFilter()
                if withHorizontalFilter,
                   let filterButtons = filterButtons,
                   selectedFilterItem != nil
                {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(filterButtons) { button in
                                CarouselFilterButton(
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
        }
        .padding()
    }
}

/// `CarouselFilterButton` displays a single filter button that updates the selected status when tapped.
///
/// The button shows an icon (system image) and a title. When the button is pressed,
/// its title is assigned to the bound `selectedFilterItem`.
private struct CarouselFilterButton: View {
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
