package com.shaktitva.app.viewmodel

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import androidx.lifecycle.ViewModel
import com.example.shaktitva.data.network.response_model.WomanApiResponse
import com.shaktitva.app.data.network.apiservice.Resource
import com.shaktitva.app.data.repository.WomanRepository
import com.shaktitva.app.ui.auth.model.LoginWoman
import com.shaktitva.app.util.AbsentLiveData
import javax.inject.Inject

class AuthViewModel @Inject constructor( val womanRepository: WomanRepository):ViewModel(){
    val _loginUser = MutableLiveData<LoginWoman>()
    var Phone = MutableLiveData<String>()
    var Password = MutableLiveData<String>()
    var woman: LiveData<Resource<WomanApiResponse>>? =null
  fun getUser() = _loginUser
    init{
        var login : LoginWoman = LoginWoman(Phone.value!!,Password.value!!)
        _loginUser.value = login
        Log.d("Login User", _loginUser.toString())
    }
    fun onLoginButtonClicked(): LiveData<Resource<WomanApiResponse>> {
       Log.d("Login From ViewModel","Login called from ViewModel")
        Log.d("login part 2","loginUSER"+_loginUser.value?.phone)
       return Transformations.switchMap(_loginUser) {
            if (_loginUser.value?.phone == null) {
                Log.d("Absent ERROR","Error in Fetching the woman"+AbsentLiveData.toString())
                AbsentLiveData.create()
            } else {
                womanRepository.womanLogin(
                    _loginUser.value!!.phone, _loginUser.value!!.strPassword
                )
            }
        }

    }
}

