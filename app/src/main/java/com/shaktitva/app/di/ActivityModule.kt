package com.shaktitva.app.di
import com.shaktitva.app.MainActivity
import com.shaktitva.app.ui.auth.LoginActivity
import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
abstract class ActivityModule {

    @ContributesAndroidInjector()
    abstract fun contributeLoginActivity(): LoginActivity
//    abstract fun contributeLoginActivity(): LoginActivity
//    abstract fun contributeSignUpAcitivity(): SignUpAcitivity

}