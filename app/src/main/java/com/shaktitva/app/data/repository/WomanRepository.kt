package com.shaktitva.app.data.repository

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.shaktitva.data.network.response_model.WomanApiResponse
import com.shaktitva.app.AppExecutors
import com.shaktitva.app.data.network.apiservice.ApiResponse
import com.shaktitva.app.data.network.apiservice.ApiService
import com.shaktitva.app.data.network.apiservice.NetworkBoundResourceNetworkOnly
import com.shaktitva.app.data.network.apiservice.Resource
import com.shaktitva.app.data.room.dao.WomanDao
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class WomanRepository @Inject constructor(
    private val appExecutors: AppExecutors,
    private val womanDao: WomanDao,
    private val apiService:ApiService
)
{
  fun womanLogin(phone_number: String, password:String):LiveData<Resource<WomanApiResponse>>{
     return object : NetworkBoundResourceNetworkOnly<WomanApiResponse>() {

         override fun createCall(): LiveData<ApiResponse<WomanApiResponse>> {
             Log.d("Request","Request sent")
             return apiService.login(phone_number,password)
         }

     }.asLiveData()
}

}
