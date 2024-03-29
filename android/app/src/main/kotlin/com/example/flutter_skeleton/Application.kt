package com.example.flutter_skeleton

import android.os.Bundle

import io.flutter.app.FlutterApplication
import io.flutter.plugins.GeneratedPluginRegistrant

import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

class Application: FlutterApplication(), PluginRegistrantCallback {
  override fun onCreate() {
    super.onCreate()
    FlutterFirebaseMessagingService.setPluginRegistrant(this);
  }

  override fun registerWith(registry: PluginRegistry?) {
    GeneratedPluginRegistrant.registerWith(registry);
  }
}
