package com.asgharas.kmmnotes.android.di

import android.app.Application
import com.asgharas.kmmnotes.data.local.DatabaseDriverFactory
import com.asgharas.kmmnotes.data.note.SqlDelightNoteDataSource
import com.asgharas.kmmnotes.database.NoteDatabase
import com.asgharas.kmmnotes.domain.note.NoteDataSource
import com.squareup.sqldelight.db.SqlDriver
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@InstallIn(SingletonComponent::class)
@Module
object AppModule {

    @Provides
    @Singleton
    fun providesSqlDriver(app: Application): SqlDriver {
        return DatabaseDriverFactory(app).createDriver()
    }

    @Provides
    @Singleton
    fun providesNoteDataSource(driver: SqlDriver): NoteDataSource {
        return SqlDelightNoteDataSource(NoteDatabase(driver))
    }
}