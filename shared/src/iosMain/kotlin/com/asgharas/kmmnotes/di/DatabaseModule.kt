package com.asgharas.kmmnotes.di

import com.asgharas.kmmnotes.data.local.DatabaseDriverFactory
import com.asgharas.kmmnotes.data.note.SqlDelightNoteDataSource
import com.asgharas.kmmnotes.database.NoteDatabase
import com.asgharas.kmmnotes.domain.note.NoteDataSource

class DatabaseModule {

    private val factory by lazy { DatabaseDriverFactory() }
    val noteDataSource: NoteDataSource by lazy {
        SqlDelightNoteDataSource(NoteDatabase(factory.createDriver()))
    }
}