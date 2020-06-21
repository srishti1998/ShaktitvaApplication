package com.shaktitva.app;

import android.app.Activity
import android.app.Application;
import com.shaktitva.app.di.DaggerAppComponentMain
import dagger.android.DispatchingAndroidInjector
import dagger.android.HasActivityInjector
import javax.inject.Inject

class MainApplication : Application(), HasActivityInjector {

@Inject
    lateinit var dispatchingAndroidInjector: DispatchingAndroidInjector<Activity>

    override fun activityInjector(): DispatchingAndroidInjector<Activity>? {
        return dispatchingAndroidInjector
        }

        override fun onCreate() {
        super.onCreate()
//            Stetho.initializeWithDefaults(this);
            DaggerAppComponentMain.builder()
        .application(this)
        .build()
        .inject(this)
        }
        }