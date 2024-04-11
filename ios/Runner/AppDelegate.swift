import UIKit
import Flutter
import FBSDKCoreKit
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
   
    var paymentChannel:FlutterMethodChannel!
  override func application(
   _ application: UIApplication,
   
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
         paymentChannel = FlutterMethodChannel(name: "e-learning-payment",
                                              binaryMessenger: controller.binaryMessenger)
     
        paymentChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method{
        case "show":
            print("showwwwwwwww")
            self.paymentVnpay( call: call)
        default:
            result(FlutterMethodNotImplemented)
        }
    })
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
   


    private func paymentVnpay(call:FlutterMethodCall) {
       
        NotificationCenter.default.addObserver(self, selector:#selector(self.sdkAction(notification:)), name: NSNotification.Name("SDK_COMPLETED"), object: nil)
        CallAppInterface.setHomeViewController( viewController(with: nil)!)
        let value = call.arguments as? [String:Any]
        let isSandbox = (value?["isSandbox"]as? Bool)!
        let scheme = (value?["scheme"] as? String)!
//            let backAlert = value?["backAlert"]!
        let paymentUrl = value?["paymentUrl"] as? String
        let title = (value?["title"] as? String)!
        let iconBackName = (value?["iconBackName"] as? String)!
        let beginColor = (value?["beginColor"] as? String)!
        let endColor = (value?["endColor"] as? String)!
        let titleColor = (value?["titleColor"] as? String)!
        let tmn_code = (value?["tmn_code"]as? String)!
        CallAppInterface.setEnableBackAction(true)
        CallAppInterface.setSchemes(scheme)
        CallAppInterface.setIsSandbox(isSandbox)
   
        CallAppInterface.showPushPaymentwithPaymentURL(paymentUrl!, withTitle: title, iconBackName: iconBackName, beginColor: beginColor, endColor: endColor, titleColor: titleColor, tmn_code: tmn_code)
        
    }

    @objc func sdkAction(notification: Notification?) {
        
        print("actionnnnnnnnnnnnnnnn")
        NotificationCenter.default.removeObserver(self)

            let actionValue = (notification?.object as? NSObject)?.value(forKey: "Action") as? String
            switch actionValue {
                    case "AppBackAction":
                        paymentChannel.invokeMethod("PaymentBack", arguments: [
                            "resultCode": NSNumber(value: -1)
                        ])
                        return
                    case "CallMobileBankingApp":
                        paymentChannel.invokeMethod("PaymentBack", arguments: [
                            "resultCode": NSNumber(value: 10)
                        ])
                        return
                    case "WebBackAction":
                        paymentChannel.invokeMethod("PaymentBack", arguments: [
                            "resultCode": NSNumber(value: 24)
                        ])
                        return
                    case "FailBackAction":
                        paymentChannel.invokeMethod("PaymentBack", arguments: [
                            "resultCode": NSNumber(value: 99)
                        ])
                        return
                    case "SuccessBackAction":
                        paymentChannel.invokeMethod("PaymentBack", arguments: [
                            "resultCode": NSNumber(value: 0)
                        ])
                        return
                    default:
                        return
                    }
        
    }
 
    func viewController(with window: UIWindow?) -> UIViewController? {
        var windowToUse = window
        if windowToUse == nil {
            for window in UIApplication.shared.windows {
                if window.isKeyWindow {
                    windowToUse = window
                    break
                }
            }
        }

        var topController = windowToUse?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController
    }
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
         
            print(url)
            if url.scheme != nil {
                
                if url.host ==  "vnpay" {
                     print("is login by facebook")
                     return ApplicationDelegate.shared.application(app, open: url, options: options)
                }
            }
            
            return false

        }
}
