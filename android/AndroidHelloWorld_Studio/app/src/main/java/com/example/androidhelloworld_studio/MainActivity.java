package com.example.androidhelloworld_studio;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private int feedingCounter;

    private enum CatStatus {
        READY_TO_EAT, EATING, REST_AFTER
    }
    private CatStatus catStatus = CatStatus.READY_TO_EAT;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageView catImage = findViewById(R.id.catImageView);
        catImage.setImageResource(R.mipmap.cat_hungry_foreground);

        TextView catAction = findViewById(R.id.catActionTextView);
        catAction.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d("Debug", "catAction TextView is clicked!");
                switch (catStatus) {
                    case READY_TO_EAT:
                        feedingCounter++;
                        catAction.setText(String.format("Cat got %d mouse", feedingCounter));
                        catImage.setImageResource(R.mipmap.cat_and_mice_foreground);
                        catStatus = CatStatus.EATING;
                        break;

                    case EATING:
                        feedingCounter++;
                        if (feedingCounter == 10) {
                            catAction.setText("Cat is full!");
                            catImage.setImageResource(R.mipmap.cat_full_foreground);
                            catStatus = CatStatus.REST_AFTER;
                        } else {
                            catAction.setText(String.format("Cat got %d mouses", feedingCounter));
                        }
                        break;

                    case REST_AFTER:
                        feedingCounter = 0;
                        catAction.setText("Cat is hungry :(");
                        catImage.setImageResource(R.mipmap.cat_hungry_foreground);
                        catStatus = CatStatus.READY_TO_EAT;
                        break;
                    default:
                        break;
                }
            }
        });
    }
}