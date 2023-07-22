package com.asgharas.kmmnotes.android.note_list

import com.asgharas.kmmnotes.domain.note.Note

data class NoteListState(
    val notes: List<Note> = emptyList(),
    val searchText: String = "",
    val isSearchActive: Boolean = false,

    )
