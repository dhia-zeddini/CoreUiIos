//
//  GenericListView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 8/4/2025.
//

import SwiftUI

public struct GenericListView<Item: Identifiable, ListRow: View>: View {
    @State private var searchText = ""
    @State private var showAdd = false
    @State private var showDetails = false
    @State private var selectedItem: Item?
    
    let title: String
    let itemsList: [Item]
    @ViewBuilder let listRow: (Item) -> ListRow
    let onAppearAction: () -> Void
    let onDelete: (Item) -> Void
    let onEdit: (Item) -> Void
    let onDetails: (Item) -> Void
    
    public init(
        title: String,
        itemsList: [Item],
        @ViewBuilder listRow: @escaping (Item) -> ListRow,
        onAppearAction: @escaping () -> Void,
        onDelete: @escaping (Item) -> Void,
        onEdit: @escaping (Item) -> Void,
        onDetails: @escaping (Item) -> Void
    ) {
        self.title = title
        self.itemsList = itemsList
        self.listRow = listRow
        self.onAppearAction = onAppearAction
        self.onDelete = onDelete
        self.onEdit = onEdit
        self.onDetails = onDetails
    }
    
    public var body: some View {
        VStack {
            headerSection
            searchField
            List {
                ForEach(itemsList) { item in
                    listRow(item)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                onDelete(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                            Button {
                                onEdit(item)
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                        }
                        .onTapGesture {
                            onDetails(item)
                        }
                }
            }
           // .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .onAppear {
                onAppearAction()
            }
            .refreshable {
                onAppearAction()
            }
        }
        .sheet(isPresented: $showAdd) {
            // add form here
        }
        .sheet(isPresented: $showDetails) {
            // details view here
        }
    }
    
    private var headerSection: some View {
        HStack(spacing: 15) {
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(Color(.black))
            Spacer(minLength: 0)
            Button(action: {
                showAdd.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.primaryColor)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private var searchField: some View {
        TextField("Search by name", text: $searchText)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    private var filteredItems: [Item] {
        if searchText.isEmpty {
            return itemsList
        } else {
            return itemsList.filter { item in
                return true
            }
        }
    }
}

