package com.onfido.sdk.flutter.helpers

import com.onfido.android.sdk.capture.config.BiometricTokenCallback
import com.onfido.sdk.flutter.OnfidoPlugin
import io.flutter.plugin.common.MethodChannel

class BiometricTokenCallbackBridge : BiometricTokenCallback {

    override fun onTokenGenerated(customerUserHash: String, biometricToken: String) {
        val methodChannel = OnfidoPlugin.channel
        val args = mutableMapOf<String, Any>()
        args["customerUserHash"] = customerUserHash
        args["biometricToken"] = biometricToken
        methodChannel.invokeMethod("onTokenGenerated", args)
    }

    override fun onTokenRequested(customerUserHash: String, provideToken: (String) -> Unit) {
        val methodChannel = OnfidoPlugin.channel
        val args = mutableMapOf<String, Any>()
        args["customerUserHash"] = customerUserHash
        methodChannel.invokeMethod("onTokenRequested", args, object : MethodChannel.Result {
            override fun success(token: Any?) {
                if (token is String) {
                    provideToken(token)
                }
            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                println("BiometricTokenCallbackBridge. Error $errorMessage")
            }

            override fun notImplemented() {
            }
        })
    }
}
