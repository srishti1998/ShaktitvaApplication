package com.shaktitva.app.util

import androidx.lifecycle.LiveData
import retrofit2.CallAdapter
import retrofit2.Retrofit
import java.lang.reflect.ParameterizedType
import java.lang.reflect.Type
import com.shaktitva.app.data.network.apiservice.ApiResponse
class LiveDataCallAdapterFactory : CallAdapter.Factory() {
    override fun get(
        returnType: Type?,
        annotations: Array<Annotation?>?,
        retrofit: Retrofit?
    ): CallAdapter<*, *>? {
        if (getRawType(returnType) != LiveData::class.java) {
            return null
        }
        val observableType: Type = getParameterUpperBound(
            0,
            returnType as ParameterizedType?
        )
        val rawObservableType =
            getRawType(observableType)
        require(rawObservableType == ApiResponse::class.java) { "type must be a resource" }
        require(observableType is ParameterizedType) { "resource must be parameterized" }
        val bodyType: Type = getParameterUpperBound(
            0,
            observableType as ParameterizedType
        )
        return LiveDataCallAdapter<Any>(responseType = bodyType)
    }
}