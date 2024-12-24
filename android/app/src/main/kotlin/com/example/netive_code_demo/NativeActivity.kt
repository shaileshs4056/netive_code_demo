package com.example.netive_code_demo

import android.os.Bundle
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity

class NativeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val data = intent.getStringExtra("data") ?: ""
        val textField = findViewById<EditText>(R.id.text_display)
        textField.setText(data)
    }
}
