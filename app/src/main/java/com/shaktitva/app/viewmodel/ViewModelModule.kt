package com.shaktitva.app.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.example.shaktitva.viewmodel.ViewModelKey
import dagger.Binds
import dagger.Module
import dagger.multibindings.IntoMap

@Module
internal abstract class ViewModelModule {

    @Binds
    internal abstract fun bindViewModelFactory(factory: ViewModelFactory): ViewModelProvider.Factory
    /*
    * This method basically says
    * inject this object into a Map using the @IntoMap annotation,
    * with the  AuthViewModel.class as key,
    * and a Provider that will build a AuthViewModel
    * object.
    * ViewModel Key is a map of key value pairs
    *
    * */

    @Binds
    @IntoMap
    @ViewModelKey(AuthViewModel::class)
    protected abstract fun authViewModel(authViewModel: AuthViewModel): ViewModel
}