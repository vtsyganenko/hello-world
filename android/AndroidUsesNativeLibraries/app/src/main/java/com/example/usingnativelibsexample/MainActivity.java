package com.example.usingnativelibsexample;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.usingnativelibsexample.databinding.ActivityMainBinding;
import com.google.android.material.textfield.TextInputEditText;

public class MainActivity extends AppCompatActivity {

    // Used to load the 'nativelibrary' library on application startup.
    static {
        System.loadLibrary("nativelibrary");
    }

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        TextInputEditText input1 = findViewById(R.id.TextInput1);
        TextInputEditText input2 = findViewById(R.id.TextInput2);

        TextView resultPlus = findViewById(R.id.TextViewPlusResult);
        TextView resultMinus = findViewById(R.id.TextViewMinusResult);

        Button plusBtn = findViewById(R.id.ButtonPlus);
        plusBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d("Debug", "Plus button is clicked");
                int value1 = getInputValue(input1);
                int value2 = getInputValue(input2);
                int result = plusAction(value1, value2);
                resultPlus.setText(String.valueOf(result));
            }
        });

        Button minusBtn = findViewById(R.id.ButtonMinus);
        minusBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d("Debug", "Minus button is clicked");
                int value1 = getInputValue(input1);
                int value2 = getInputValue(input2);
                int result = minusAction(value1, value2);
                resultMinus.setText(String.valueOf(result));
            }
        });
    }

    private int getInputValue(TextInputEditText textInput) {
        String str = textInput.getText().toString();
        int value = 0;
        try {
            value = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            Log.d("Debug", "NumberFormatException: " + e.getMessage() + " getInputValue() returns 0");
        }
        return value;
    }

    /**
     * A native method that is implemented by the 'usingnativelibsexample' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();

    public native int plusAction(int value1, int value2);

    public native int minusAction(int value1, int value2);
}