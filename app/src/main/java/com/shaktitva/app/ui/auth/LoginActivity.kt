package com.shaktitva.app.ui.auth

import android.os.Bundle
import android.text.Editable
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import com.example.shaktitva.data.network.response_model.WomanApiResponse
import com.shaktitva.app.R
import com.shaktitva.app.data.network.apiservice.ApiResponse
import com.shaktitva.app.data.network.apiservice.Resource
import com.shaktitva.app.data.network.apiservice.Status
import com.shaktitva.app.databinding.ActivityLoginBinding
import com.shaktitva.app.ui.auth.model.LoginWoman
import com.shaktitva.app.viewmodel.AuthViewModel
import com.shaktitva.app.viewmodel.ViewModelFactory
import dagger.android.AndroidInjection
import javax.inject.Inject


class LoginActivity : AppCompatActivity() {



    @Inject
    lateinit var viewModelFactory: ViewModelFactory

    lateinit var authViewModel: AuthViewModel
    lateinit var binding:ActivityLoginBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        AndroidInjection.inject(this)
        super.onCreate(savedInstanceState)
         binding =
            DataBindingUtil.setContentView(this, R.layout.activity_login)
//        binding. = LinearLayoutManager(applicationContext, LinearLayoutManager.HORIZONTAL, false)

        authViewModel = ViewModelProviders.of(this, viewModelFactory).get(AuthViewModel::class.java)

        binding.setLifecycleOwner(this);

        binding.viewModel = authViewModel
//        binding.loginButton.setOnClickListener { v: View? -> Log.d("Login Button","Login Button Called")  }
//        val loginUser:LiveData<LoginWoman> = authViewModel.getUser()
//        loginUser.observe(this, Observer <LoginWoman> { data: LoginWoman->
//            if(data.isPasswordLengthGreaterThan4)
//            {
//               loginUser.value?.strPassword  = data.strPassword
//            }
//            if(data.isPhoneNumberValid)
//            {
//                loginUser.value?.phone  = data.phone
//            }
//        }  )
        val result: LiveData<Resource<WomanApiResponse>> = authViewModel.onLoginButtonClicked()

        result.observe(this,
            Observer<Resource<WomanApiResponse?>> { newData: Resource<WomanApiResponse?> ->
                if (newData.status.equals(Status.ERROR)) { //Can also have a Status Enum
              Log.println(Log.ERROR,"LoginActivity","Error in Fetching the woman")
                } else if (newData.status.equals(Status.LOADING)) {
                    Log.println(Log.DEBUG,"LoginActivity","Loading")
                }
                else
                    Log.println(Log.DEBUG,"LoginActivity","Success")

            }
        )
}

//    override fun onStart() {
//        super.onStart()
////        authViewModel = ViewModelProviders.of(this, viewModelFactory).get(AuthViewModel::class.java)
////
////        binding.setLifecycleOwner(this);
////
////        binding.viewModel = authViewModel
//        val result: LiveData<Resource<WomanApiResponse>> = authViewModel.onLoginButtonClicked()
//
//        result.observe(this,
//            Observer<Resource<WomanApiResponse?>> { newData: Resource<WomanApiResponse?> ->
//                if (newData.status.equals(Status.ERROR)) { //Can also have a Status Enum
//                    Log.println(Log.ERROR,"LoginActivity","Error in Fetching the woman")
//                } else if (newData.status.equals(Status.LOADING)) {
//                    Log.println(Log.DEBUG,"LoginActivity","Loading")
//                }
//                else
//                    Log.println(Log.DEBUG,"LoginActivity","Success")
//
//            }
//        )
//    }

}
