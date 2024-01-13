package com.example.androidhelloworld_kotlin

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.ImageView
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    var catImage: ImageView? = null
    var catAction: TextView? = null

    enum class CatState {
        SLEEP, PET, PLAY
    }
    var catStatus: CatState = CatState.SLEEP

    var petCount = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        catImage = findViewById(R.id.catImageView)
        catAction = findViewById(R.id.catActionTextView)

        catImage?.let {
            it.setOnClickListener({
                Log.d("MEOW", "cat image clicked!")
                catAction?.setText("MEOW!")
            })
        }

        catAction?.let {
            it.setOnClickListener({
                Log.d("MEOW", "cat action clicked!")
                when(catStatus) {
                    CatState.SLEEP -> catSleepsActionHandler()
                    CatState.PET -> catIsPetActionHandler()
                    CatState.PLAY -> catPlaysActionHandler()
                }
            })
        }

    }

    fun catSleepsActionHandler() {
        catImage?.setImageResource(R.drawable.pet_the_cat)
        catStatus = CatState.PET
        catAction?.setText("You pet the Cat!")
        petCount = 1
    }

    fun catIsPetActionHandler() {
        petCount++
        if(petCount == 6) {
            catImage?.setImageResource(R.drawable.cat_plays)
            catStatus = CatState.PLAY
            catAction?.setText("What's enough. Time to play!")
        } else {
            catAction?.setText(String.format("You pet the Cat %d times!", petCount))
        }
    }

    fun catPlaysActionHandler() {
        catImage?.setImageResource(R.drawable.cat_sleeps)
        catStatus = CatState.SLEEP
        catAction?.setText("Pet the Cat!")
    }
}