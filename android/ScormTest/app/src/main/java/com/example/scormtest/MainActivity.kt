package com.example.scormtest

import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException


class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        createFile()
        toolbarSetUp()
    }

    override fun onResume() {
        super.onResume()
        buttonsSetUp()
    }

    private fun toolbarSetUp() {
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        toolbar.setTitleTextColor(Color.WHITE)
        setSupportActionBar(toolbar)
    }


    private fun buttonsSetUp() {
        val goToWebViewButton = findViewById<Button>(R.id.to_web_view_btn)
        val goToCCTButton = findViewById<Button>(R.id.to_cct_btn)

        goToWebViewButton.setOnClickListener { launchWebViewPage() }
        goToCCTButton.setOnClickListener { launchChromeCustomTabPage() }
    }


    private fun launchWebViewPage() {
        val intent = Intent(this@MainActivity, WebViewListActivity::class.java)
        startActivity(intent)
    }

    private fun launchChromeCustomTabPage() {
        val intent = Intent(this@MainActivity, ChromeCustomTabActivity::class.java)
        startActivity(intent)
    }

    private fun createFile(){


        // Get the application's directory in internal storage
        val appDirectory = File(getExternalFilesDir(null), "")

        // Specify the file name and path within the app's directory

        // Specify the file name and path within the app's directory
        val fileName = "example3.txt"
        val letDirectory = File(appDirectory, "LET")
        letDirectory.mkdirs()

        val file = File(letDirectory, fileName)



        try {
            // Create the file

//            // Write to the file
//            FileOutputStream(file).use { it.write("record goes here".toByteArray()) }
//        // Read from the file
//        val inputAsString = FileInputStream(file).bufferedReader().use { it.readText() }





            if (file.createNewFile()) {
                // File creation successful
                FileOutputStream(file).use { it.write("test3 : record goes here ".toByteArray()) }
                Log.d("FileCreation", "File created successfully: " + file.absolutePath)
            } else {
                // File already exists
                Log.d("FileCreation", "File already exists: " + file.absolutePath)
            }



        } catch (e: IOException) {
            e.printStackTrace()
        }


    }


}