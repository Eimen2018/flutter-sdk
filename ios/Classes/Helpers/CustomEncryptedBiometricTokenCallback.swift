//
//  CustomEncryptedBiometricTokenCallback.swift
//  onfido_sdk
//
//  Created by Dylan Maryk on 14/10/2024.
//

import Foundation
import Onfido

class CustomEncryptedBiometricTokenCallback: Onfido.EncryptedBiometricTokenHandler {
    func onTokenRequested(customerUserHash: String, completion: @escaping (String) -> Void) {
        guard let channel = SwiftOnfidoSdkPlugin.channel else { return }
        let arguments = ["customerUserHash": customerUserHash]
        channel.invokeMethod("onTokenRequested", arguments: arguments) { result in
            guard let token = result as? String else { return }
            completion(token)
        }
    }

    func onTokenGenerated(customerUserHash: String, encryptedBiometricToken: String) {
        guard let channel = SwiftOnfidoSdkPlugin.channel else { return }
        let arguments = ["customerUserHash": customerUserHash, "biometricToken": encryptedBiometricToken]
        channel.invokeMethod("onTokenGenerated", arguments: arguments)
    }
}
