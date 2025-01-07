package com.example.netive_code_demo

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class NativeActivity : AppCompatActivity() {

    private val CHANNEL = "com.example.myapp/navigation"  // Correct channel name
    private lateinit var flutterEngine: FlutterEngine
    private lateinit var platform: MethodChannel  // Define platform as MethodChannel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)  // Your custom layout for NativeActivity

        // Initialize FlutterEngine
        flutterEngine = FlutterEngine(this)
        // Register the necessary plugins with the FlutterEngine
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Initialize MethodChannel
        platform = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        // Verify if the method channel is set up correctly
        println("Flutter MethodChannel initialized.")
        // Find the EditText field by ID
        val editText = findViewById<EditText>(R.id.text_display)
        // Set a TextWatcher to the EditText field
        editText.addTextChangedListener(/* watcher = */ object : TextWatcher {
            override fun afterTextChanged(s: Editable?) {
                // Call the API whenever the text changes
                println("Text changed: ${s.toString()}")
                makeApiCall()  // This calls your API method
            }
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
                // Optional: handle logic before the text changes
            }
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                // Optional: handle logic when the text is changing
            }
        })
    }
    // Function to invoke the API call on Flutter side
    private fun makeApiCall() {

        try {
            println("Performing API Call")
            // Perform the API call by invoking the Flutter method
            platform.invokeMethod("makeApiCall",null)
            println("API Call Sent to Flutter") // Call to Flutter to execute the API function
        } catch (e: Exception) {
            println("Error in makeApiCall: ${e.message}")
            // Handle error in case the method call fails
            platform.invokeMethod("apiError", e.toString())
        }
    }

    override fun onResume() {
        super.onResume()
        // Setup method call handler for Flutter -> Native communication
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "apiResponse" -> {
                        val apiResult = call.arguments as String
                        println("API Response received from Flutter: $apiResult")  // Handle the API response
                    }
                    "apiError" -> {
                        val error = call.arguments as String
                        println("API Error received from Flutter: $error")  // Handle API error
                    }
                    else -> result.notImplemented()
                }
            }
    }

    override fun onDestroy() {
        super.onDestroy()
        flutterEngine.destroy()  // Clean up the Flutter engine to avoid memory leaks
    }
}
