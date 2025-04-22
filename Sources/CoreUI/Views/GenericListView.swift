//
//  GenericListView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 8/4/2025.
//

import SwiftUI

public struct GenericListView<Item: Identifiable, ListRow: View>: View {
    @State private var showDetails = false
    @State private var selectedItem: Item?
    @State private var showDeleteAlert = false

    let title: String
    let itemsList: [Item]
    let isLoading: Bool
    let showPlusButton: Bool
    @Binding var showAddForm: Bool
    @Binding var triggerPagination: Bool
    let sheetFraction: CGFloat
    let sheetHeight: CGFloat
    @ViewBuilder let header: () -> any View
    @ViewBuilder let addFrom: () ->  AnyView
    @ViewBuilder let listRow: (Item) -> ListRow
    @ViewBuilder let detailsView: (Item?) ->  AnyView
    let onAppearAction: () -> Void
    let paginationAction: () -> Void
    let onDelete: (Item?) -> Void

    public init(
        title: String,
        itemsList: [Item],
        isLoading: Bool,
        showPlusButton: Bool = true,
        showAddForm: Binding<Bool>,
        triggerPagination: Binding<Bool> = .constant(false),
        sheetFraction: CGFloat,
        sheetHeight: CGFloat,
        @ViewBuilder header: @escaping () -> any View,
        @ViewBuilder addFrom: @escaping () ->  AnyView = {AnyView(EmptyView())},
        @ViewBuilder listRow: @escaping (Item) -> ListRow,
        @ViewBuilder detailsView: @escaping (Item?) ->  AnyView = {_ in AnyView(EmptyView())},
        onAppearAction: @escaping () -> Void,
        paginationAction: @escaping () -> Void = {},
        onDelete: @escaping (Item?) -> Void
    ) {
        self.title = title
        self.itemsList = itemsList
        self.isLoading = isLoading
        self.showPlusButton = showPlusButton
        self._showAddForm = showAddForm
        self._triggerPagination = triggerPagination
        self.sheetFraction = sheetFraction
        self.sheetHeight = sheetHeight
        self.header = header
        self.addFrom = addFrom
        self.listRow = listRow
        self.detailsView = detailsView
        self.onAppearAction = onAppearAction
        self.paginationAction = paginationAction
        self.onDelete = onDelete
    }

    public var body: some View {
        VStack {
            titleSection
            AnyView(header())
            List {
                if isLoading {
                    ForEach(0..<4) { _ in
                        LinearProgressView()
                    }
                }
                ForEach(itemsList) { item in
                    listRow(item)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                selectedItem = item
                                showDeleteAlert = true
                            } label: {
                                Label(DeleteAlertConfirmationButton, systemImage: "trash")
                            }
                            .tint(.red)
                        }
                        .onTapGesture {
                            selectedItem = item
                            showDetails.toggle()
                        }
                    if item.id == itemsList.last?.id && !isLoading && triggerPagination{
                        ProgressView()
                            .onAppear {
                                paginationAction()
                            }
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                onAppearAction()
            }
            .refreshable {
                onAppearAction()
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showAddForm) {
            if #available(iOS 16.4, *) {
                addFrom()
                    .presentationDetents([
                        .fraction(sheetFraction), .height(sheetHeight),
                    ])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
            } else {
                addFrom()
            }
        }
        .sheet(isPresented: $showDetails) {
            if #available(iOS 16.4, *) {
                detailsView(selectedItem)
                    .presentationDetents([
                        .fraction(sheetFraction), .height(sheetHeight),
                    ])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
            } else {
                detailsView(selectedItem)
            }
        }
        .alert(isPresented:$showDeleteAlert) {
            Alert(
                title: Text(DeleteAlertTitle),
                message: Text(DeleteAlertMessage),
                primaryButton: .destructive(Text(DeleteAlertConfirmationButton)) {
                    onDelete(selectedItem)
                },
                secondaryButton: .cancel()
            )
        }
    }

    private var titleSection: some View {
        VStack(alignment: .leading) {
            BackButton()
            HStack(spacing: 15) {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(.black))
                Spacer(minLength: 0)
                if showPlusButton{
                    plusButton
                }
            }
        }.padding(.horizontal)

    }
    private var plusButton: some View {
        Button(action: {
            showAddForm.toggle()
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
}
