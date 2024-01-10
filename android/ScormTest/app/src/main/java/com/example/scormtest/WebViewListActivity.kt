package com.example.scormtest

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.widget.Toolbar

class WebViewListActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view_list)

        toolbarSetUp()
    }

    override fun onResume() {
        super.onResume()
        buttonsSetUp()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    private fun toolbarSetUp() {
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        toolbar.title = "Web View List"
        toolbar.setTitleTextColor(Color.WHITE)
        setSupportActionBar(toolbar)
        supportActionBar?.let {
            it.setDisplayHomeAsUpEnabled(true)
            it.setDisplayShowHomeEnabled(true)
        }
    }

    private fun buttonsSetUp() {
        val simpleGolfButton = findViewById<Button>(R.id.simple_golf_btn)
        val golfWithAlertButton = findViewById<Button>(R.id.golf_with_alert_btn)
        val bvButton = findViewById<Button>(R.id.bv_btn)
        val bvOpenedOnChromeButton = findViewById<Button>(R.id.bv_opened_on_chrome_btn)

        simpleGolfButton.setOnClickListener {
            loadWebView(ScormList.SIMPLE_GOLF)
        }
        golfWithAlertButton.setOnClickListener {
            loadWebView(ScormList.GOLF_WITH_ALERT)
        }
        bvButton.setOnClickListener {
            loadWebView(ScormList.BV)
        }
        bvOpenedOnChromeButton.setOnClickListener {
            loadWebView(ScormList.BV_OPENED_ON_CHROME)
        }
    }

    private fun loadWebView(url: String) {
        val intent = Intent(this@WebViewListActivity, WebViewActivity::class.java)
        intent.putExtra("url", url)
        println("loadWebView url:"+url)

        startActivity(intent)
    }
}