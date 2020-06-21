package com.example.shaktitva.data.network.response_model

import com.shaktitva.app.data.room.entity.WomanEntity
data class WomanApiResponse(
                             val statusMessage:String,
                             val result: WomanEntity?)  //Woman entity can be null when sign up is done as only status is returned