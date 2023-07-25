//
//  NoteDetailScreen.swift
//  iosApp
//
//  Created by Asghar on 7/25/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteDetailScreen: View {
    private var noteDataSource: NoteDataSource
    private var noteId: Int64? = nil
    
    init(noteDataSource: NoteDataSource, noteId: Int64? = nil) {
        self.noteDataSource = noteDataSource
        self.noteId = noteId
    }
    
    @StateObject private var viewModel = NoteDetailViewModel(noteDataSource: nil)
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter a title...", text: $viewModel.noteTitle)
                .font(.title)
            TextField("Enter some content..", text: $viewModel.noteContent)
            Spacer()
        }
        .toolbar {
            Button {
                viewModel.saveNote {
                    dismiss()
                }
            } label: {
                Image(systemName: "checkmark")
            }
        }
        .padding()
        .background(Color(hex: viewModel.noteColor))
        .onAppear {
            viewModel.setParams(noteDataSource: noteDataSource, noteId: noteId)
        }
    }
}

struct NoteDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
