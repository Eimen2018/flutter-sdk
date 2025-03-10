package com.onfido.sdk.flutter.serializer

import com.onfido.android.sdk.capture.upload.Captures
import com.onfido.android.sdk.capture.upload.Document
import com.onfido.android.sdk.capture.upload.Face
import com.onfido.android.sdk.capture.upload.ProofOfAddress
import com.onfido.android.sdk.capture.upload.ProofOfAddress.ProofOfAddressDocumentSide


internal fun Captures.toFlutterResult(): Any {
    val elements = mutableMapOf<String, Any>()

    this.document?.let {
        elements["document"] = it.deserialize()
    }

    this.face?.let {
        elements["face"] = it.deserialize()
    }

    this.poa?.let {
        elements["proofOfAddress"] = it.deserialize()
    }

    return listOf(elements)
}

private fun Face.deserialize(): Map<*, *> {
    return mapOf("id" to id, "variant" to this.variant.ordinal)
}

private fun Document.deserialize(): Map<*, *> {
    val map = mutableMapOf<String, Any>()

    map["typeSelected"] = this.type.toString().lowercase()
    map["nfcMediaId"] = this.nfcMediaUUID.toString()

    front?.let {
        map["front"] = mapOf("id" to it.id)
    }

    back?.let {
        map["back"] = mapOf("id" to it.id)
    }

    return map
}

private fun ProofOfAddress.deserialize(): Map<*, *> {
    val map = mutableMapOf<String, Any>()
    map["type"] = this.type

    map["front"] = front.deserialize()

    back?.let {
        map["back"] = it.deserialize()
    }

    return map
}

private fun ProofOfAddressDocumentSide.deserialize(): Map<*, *> {
    return mapOf("id" to id, "type" to type)
}
