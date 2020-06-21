package com.shaktitva.app.data.room


import androidx.room.Database
import androidx.room.RoomDatabase
import com.shaktitva.app.data.room.dao.WomanDao
import com.shaktitva.app.data.room.entity.WomanEntity

@Database(entities = [WomanEntity::class], version = 1, exportSchema = false)
abstract class LocalAppDatabase : RoomDatabase() {

    abstract fun womanDao(): WomanDao
}