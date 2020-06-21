package com.shaktitva.app.data.room.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "WomanEntity")
data class WomanEntity(
    @PrimaryKey
    @ColumnInfo(name = "phone_number")
    val phone_number: String="",

    @ColumnInfo(name ="city")
    var city: String="",

    @ColumnInfo(name = "description")
    var description: String?="",

    @ColumnInfo(name ="state")
    var state: String="",

    @ColumnInfo(name ="username")
    var username: String=""
)
{
}