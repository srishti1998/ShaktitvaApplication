package com.shaktitva.app.data.room.dao

import androidx.lifecycle.LiveData
import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import com.shaktitva.app.data.room.entity.WomanEntity

//Define data operations here on locally stored woman
@Dao
public interface WomanDao {
    //Insert woman in the local database who will sign up
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertWoman(woman: WomanEntity):Long

    //Find the woman object from phone number
    @Query("SELECT * FROM WomanEntity WHERE phone_number = :phone_number")
    fun findUser(phone_number: String): LiveData<WomanEntity>

}
