import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.leadpresence.evnt/device_info",
      binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler { (call, result) in
      if call.method == "getDeviceInfo" {
        self.getDeviceInfo(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   private func getDeviceInfo(result: FlutterResult) {
    let deviceInfo: [String: Any] = [
      "model": UIDevice.current.model,
      "name": UIDevice.current.name,
      "systemName": UIDevice.current.systemName,
      "systemVersion": UIDevice.current.systemVersion,
      "identifierForVendor": UIDevice.current.identifierForVendor?.uuidString ?? "unknown"
    ]
    
    result(deviceInfo)
  }
}
