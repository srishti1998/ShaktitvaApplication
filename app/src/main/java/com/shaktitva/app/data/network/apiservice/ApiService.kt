package com.shaktitva.app.data.network.apiservice

import androidx.lifecycle.LiveData
import com.example.shaktitva.data.network.response_model.WomanApiResponse
import com.shaktitva.app.data.room.entity.WomanEntity
import retrofit2.Response
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface ApiService {

    @POST("signUp")
    fun putWoman(): LiveData<ApiResponse<WomanEntity>>

    @FormUrlEncoded
    @POST("signin")
    fun login(@Field("phone")phone_number:String,@Field("password")password:String): LiveData<ApiResponse<WomanApiResponse>>
}
