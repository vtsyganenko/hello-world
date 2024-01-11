package com.example.androidhelloworld;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {
    private TextView message;
    private int counter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        message = findViewById(R.id.clickCounter);

        ImageView catImage = findViewById(R.id.catImage);
        catImage.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Log.d("Debug", "cat image is clicked!");
                tapCatImage();
            }
        });

    }

    private void tapCatImage() {
        counter++;
        if(counter == 10) {
            message.setText("Ten is enough!");
            counter = 0;
        } else {
            message.setText(String.format("Cat touch counter is %d", counter));
        }
    }
}