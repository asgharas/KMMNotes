//
//  NoteListScreen.swift
//  iosApp
//
//  Created by Asghar on 7/23/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteListScreen: View {
    private var noteDataSource: NoteDataSource
    @StateObject var viewModel = NoteListViewModel(noteDataSource: nil)
    @State private var isNoteSelected = false
    @State private var selectedNoteID: Int64? = nil
    
    init(noteDataSource: NoteDataSource) {
        self.noteDataSource = noteDataSource
    }
    
    var body: some View {
        VStack {
            ZStack {
                // navigation
                NavigationLink(destination: NoteDetailScreen(noteDataSource: self.noteDataSource, noteId: selectedNoteID), isActive: $isNoteSelected) {
                }
                .hidden()
                
                HideAbleSearchTextField(
                    onSearchToggled: {viewModel.toggleIsSearchActive()},
                    destinationProvider: {
                        NoteDetailScreen(noteDataSource: self.noteDataSource, noteId: nil)
                    },
                    isSearchActive: viewModel.isSearchActive,
                    searchText: $viewModel.searchText
                )
                .frame(maxWidth: .infinity, minHeight: 40)
                .padding()
                
                if !viewModel.isSearchActive {
                    Text("All notes")
                        .font(.title)
                }
            }
            .animation(.easeInOut, value: viewModel.isSearchActive)
            
            List {
                ForEach(viewModel.filteredNotes, id: \.self.id){ note in
                    Button(action: {
                        isNoteSelected = true
                        selectedNoteID = note.id?.int64Value
                    }){
                        NoteItem(note: note) {
                            withAnimation {
                                viewModel.deleteNoteById(id: note.id?.int64Value)
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.loadNotes()
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .onAppear {
            self.viewModel.setNoteDataSource(noteDataSource: self.noteDataSource)
        }
    }
}

struct NoteListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
