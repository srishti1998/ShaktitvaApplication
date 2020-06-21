package com.shaktitva.app.ui.auth.model

import android.util.Patterns
import androidx.databinding.BaseObservable


class LoginWoman(var phone: String, var strPassword: String) {

    val isPhoneNumberValid: Boolean
        get() = Patterns.PHONE.matcher(phone).matches()

    val isPasswordLengthGreaterThan4: Boolean
        get() = strPassword.length > 4

}