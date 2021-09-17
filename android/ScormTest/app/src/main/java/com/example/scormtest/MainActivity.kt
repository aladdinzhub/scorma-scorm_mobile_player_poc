package com.example.scormtest

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.widget.Toolbar

class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
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
}