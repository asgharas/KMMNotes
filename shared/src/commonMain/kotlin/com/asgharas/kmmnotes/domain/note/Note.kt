package com.asgharas.kmmnotes.domain.note

import com.asgharas.kmmnotes.presentation.BabyBlueHex
import com.asgharas.kmmnotes.presentation.LightGreenHex
import com.asgharas.kmmnotes.presentation.RedOrangeHex
import com.asgharas.kmmnotes.presentation.RedPinkHex
import com.asgharas.kmmnotes.presentation.VioletHex
import kotlinx.datetime.LocalDateTime

data class Note(
    val id: Long?,
    val title: String,
    val content: String,
    val colorHex: Long,
    val created: LocalDateTime
) {
    companion object {
        private val colors = listOf(RedOrangeHex, RedPinkHex, LightGreenHex, BabyBlueHex, VioletHex)

        fun generateRandomColor() = colors.random()
    }
}
