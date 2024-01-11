package com.example.scormtest

import android.annotation.SuppressLint
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.widget.Toolbar
import java.io.File
import java.io.FileInputStream
import java.io.FileNotFoundException
import java.io.FileOutputStream


class WebViewActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view)

        toolbarSetUp()
        val url = intent.getStringExtra("url")
        println("url:"+url.toString())
        webViewSetUp(url)
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    @SuppressLint("SetJavaScriptEnabled")
    private fun webViewSetUp(url: String?) {
        val webView = findViewById<WebView>(R.id.web_view)
        webView.webViewClient = WebViewClient()
        webView.loadUrl(url ?: ScormList.SIMPLE_GOLF)
        //webView.getSettings().setAllowFileAccess(true);
        webView.settings.allowFileAccess = true
        webView.settings.allowFileAccessFromFileURLs =true
        webView.settings.javaScriptEnabled = true
        webView.settings.setSupportZoom(true)
    }

    private fun toolbarSetUp() {
        val pageName = "Name"
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        toolbar.title = pageName
        toolbar.setTitleTextColor(Color.WHITE)
        setSupportActionBar(toolbar)
        supportActionBar?.let {
            it.setDisplayHomeAsUpEnabled(true)
            it.setDisplayShowHomeEnabled(true)
        }
    }

    private fun getFilesDirPath(): String {
        return filesDir.path + "/"
    }
    fun loadFile(filePath: String): File {
        val file = File(getFilesDirPath(), filePath)
        if (!file.exists()) {
            throw FileNotFoundException("File not found: $file")
        }
        return file
    }




}