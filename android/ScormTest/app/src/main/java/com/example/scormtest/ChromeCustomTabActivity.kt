package com.example.scormtest

import android.content.ComponentName
import android.graphics.Color
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.webkit.WebView
import android.widget.Button
import androidx.appcompat.widget.Toolbar
import androidx.browser.customtabs.CustomTabsClient
import androidx.browser.customtabs.CustomTabsIntent
import androidx.browser.customtabs.CustomTabsServiceConnection
import androidx.browser.customtabs.CustomTabsSession
import androidx.core.content.ContentProviderCompat.requireContext

class ChromeCustomTabActivity : AppCompatActivity() {

    companion object {
        private const val CUSTOM_TAB_PACKAGE_NAME = "com.android.chrome"
    }


    private var mCustomTabsServiceConnection: CustomTabsServiceConnection? = null
    private var mClient: CustomTabsClient? = null
    private var mCustomTabsSession: CustomTabsSession? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_custom_chrome_tab)
        toolbarSetUp()
        cctSetUp()
    }

    override fun onResume() {
        super.onResume()
        buttonsSetUp()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressed()
        return true
    }

    private fun cctSetUp() {
        mCustomTabsServiceConnection = object : CustomTabsServiceConnection() {
            override fun onCustomTabsServiceConnected(componentName: ComponentName, customTabsClient: CustomTabsClient) {
                //Pre-warming
                mClient = customTabsClient
                mClient?.warmup(0L)
                mCustomTabsSession = mClient?.newSession(null)
            }

            override fun onServiceDisconnected(name: ComponentName) {
                mClient = null
            }
        }

        CustomTabsClient.bindCustomTabsService(this, CUSTOM_TAB_PACKAGE_NAME,
            mCustomTabsServiceConnection as CustomTabsServiceConnection
        );
    }

    private fun toolbarSetUp() {
        val toolbar = findViewById<Toolbar>(R.id.toolbar)
        toolbar.title = "CCT List"
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
            loadCustomTabForSite(ScormList.SIMPLE_GOLF)
        }
        golfWithAlertButton.setOnClickListener {
            loadCustomTabForSite(ScormList.GOLF_WITH_ALERT)
        }
        bvButton.setOnClickListener {
            loadCustomTabForSite(ScormList.BV)
        }
        bvOpenedOnChromeButton.setOnClickListener {
            loadCustomTabForSite(ScormList.BV_OPENED_ON_CHROME)
        }
    }

    private fun loadCustomTabForSite(url: String) {
        val customTabsIntent = CustomTabsIntent.Builder(mCustomTabsSession)
            .setShowTitle(false)
            .build()

        customTabsIntent.launchUrl(this, Uri.parse(url))


    }
}