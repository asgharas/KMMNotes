//
//  NoteDetailViewModel.swift
//  iosApp
//
//  Created by Asghar on 7/25/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

extension NoteDetailScreen {
    @MainActor class NoteDetailViewModel: ObservableObject{
        private var noteDataSource: NoteDataSource?
        
        private var noteId: Int64? = nil
        @Published var noteTitle: String = ""
        @Published var noteContent: String = ""
        @Published private(set) var noteColor = Note.Companion().generateRandomColor()
        
        
        init(noteDataSource: NoteDataSource?) {
            self.noteDataSource = noteDataSource
        }
        
        func loadNoteIfExists(id: Int64?) {
            if id != nil {
                self.noteId = id
                noteDataSource?.getNoteById(id: id!) { note, error in
                    self.noteTitle = note?.title ?? ""
                    self.noteContent = note?.content ?? ""
                    self.noteColor = note?.colorHex ?? Note.Companion().generateRandomColor()
                }
            }
        }
        
        func saveNote(onSaved: @escaping () -> Void) {
            noteDataSource?.insertNote(
                note: Note(
                        id: noteId == nil ? nil : KotlinLong(value: noteId!),
                        title: self.noteTitle,
                        content: self.noteContent,
                        colorHex: self.noteColor,
                        created: DateTimeUtil().now()
                          )
            ) { error in
                    onSaved()
              }
        }
        
        func setParams(noteDataSource: NoteDataSource, noteId: Int64?) {
            self.noteDataSource = noteDataSource
            self.loadNoteIfExists(id: noteId)
        }
    }
}
