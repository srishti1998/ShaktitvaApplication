package com.shaktitva.app.di
import android.app.Application
import androidx.room.Room
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.shaktitva.app.data.network.apiservice.ApiService
import com.shaktitva.app.data.network.interceptor.RequestInterceptor
import com.shaktitva.app.data.room.LocalAppDatabase
import com.shaktitva.app.data.room.dao.WomanDao
import com.shaktitva.app.util.LiveDataCallAdapterFactory
import com.shaktitva.app.viewmodel.ViewModelModule
import dagger.Module
import dagger.Provides
import okhttp3.Cache
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Singleton

@Module(includes = [ViewModelModule::class])
class AppModule {
    @Singleton
    @Provides
    fun provideApiService(gson: Gson, okHttpClient: OkHttpClient): ApiService {
        return Retrofit.Builder()
            .baseUrl("https://localhost:8000/api/")
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create(gson))
            .addCallAdapterFactory(LiveDataCallAdapterFactory())
            .build()
            .create(ApiService::class.java)
    }

    /*
     * The method returns the Okhttp object
     * */
    @Provides
    @Singleton
    internal fun provideOkhttpClient(): OkHttpClient {
        val logging = HttpLoggingInterceptor()
        logging.level = HttpLoggingInterceptor.Level.BODY

        val httpClient = OkHttpClient.Builder()
//        httpClient.cache(cache)
        httpClient.addInterceptor(logging)
        httpClient.addNetworkInterceptor(RequestInterceptor())
        httpClient.connectTimeout(30, TimeUnit.SECONDS)
        httpClient.readTimeout(30, TimeUnit.SECONDS)
        return httpClient.build()
    }

    /*
      * The method returns the Gson object
      * */
    @Provides
    @Singleton
    internal fun provideGson(): Gson {
        val gsonBuilder = GsonBuilder()
        return gsonBuilder.create()
    }
    // DB MODULE STARTED
    @Singleton
    @Provides
    fun provideDb(app: Application): LocalAppDatabase {
        return Room
            .databaseBuilder(app, LocalAppDatabase::class.java, "shaktitva_local.db")
            .fallbackToDestructiveMigration()
            .build()
    }

    @Singleton
    @Provides
    fun provideWomanDao(db: LocalAppDatabase): WomanDao {
        return db.womanDao()
    }
//    @Singleton
//    @Provides
//    fun provideWomanRepository(db: LocalAppDatabase.kt): WomanDao {
//        return db.womanDao()
//    }

//    @Singleton
//    @Provides
//    fun provideRepoDao(db: GithubDb): RepoDao {
//        return db.repoDao()
//    }
}