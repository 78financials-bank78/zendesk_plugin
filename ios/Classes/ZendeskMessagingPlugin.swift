import Flutter
import UIKit


public class ZendeskMessagingPlugin: NSObject, FlutterPlugin {
      let TAG = "[ZendeskMessagingPlugin]"
    private var channel: FlutterMethodChannel
    private var zendeskMessaging: ZendeskMessaging?
    var isInitialized = false
    var isLoggedIn = false
    
    init(channel: FlutterMethodChannel) {
        self.channel = channel
        super.init();
        self.zendeskMessaging = ZendeskMessaging(flutterPlugin: self, channel: channel)
    }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "zendesk_messaging_plugin", binaryMessenger: registrar.messenger())
    let instance = ZendeskMessagingPlugin(channel: channel)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    DispatchQueue.main.async {
            self.processMethodCall(call, result: result)
        }
  }
  
  private func processMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult){
    let method = call.method
    let arguments = call.arguments as? Dictionary<String, Any>
    switch(method){
      case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
      case "initialize":
      guard let channelKey = arguments?["channelKey"] as? String else {
        result(FlutterError(code: "invalid_args", message: "Channel key is required", details: nil))
        return
      }
            // let channelKey: String = (arguments?["channelKey"] ?? "") as! String
            zendeskMessaging?.initialize(channelKey: channelKey, flutterResult: result)
        case "show":

         guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.show(rootViewController: UIApplication.shared.delegate?.window??.rootViewController, flutterResult: result)
        case "loginUser":
             guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            let jwt: String = arguments?["jwt"] as? String ?? ""
            zendeskMessaging?.loginUser(jwt: jwt, flutterResult: result)
        case "logoutUser":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.logoutUser(flutterResult: result)
        case "getUnreadMessageCount":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            result(handleMessageCount())
        case "listenUnreadMessages":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.listenMessageCountChanged()
            result(nil)
        case "isInitialized":
            result(handleInitializedStatus())
        case "isLoggedIn":
            result(handleLoggedInStatus())
        case "setConversationTags":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            let tags: [String] = arguments?["tags"] as! [String]
            zendeskMessaging?.setConversationTags(tags:tags)
            result(nil)
        case "clearConversationTags":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.clearConversationTags()
            result(nil)
        case "setConversationFields":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            let fields: [String: String] = arguments?["fields"] as! [String: String]
            zendeskMessaging?.setConversationFields(fields:fields)
            result(nil)
        case "clearConversationFields":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.clearConversationFields()
            result(nil)
        case "invalidate":
            guard isInitialized else {
                print("\(TAG) - Messaging needs to be initialized first.\n")
                reportNotInitializedFlutterError(result: result)
                return
            }
            zendeskMessaging?.invalidate()
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        
    }

  }
 private func handleMessageCount() -> Int {
        return zendeskMessaging?.getUnreadMessageCount() ?? 0
    }
    
    private func handleInitializedStatus() -> Bool {
        return isInitialized
    }
    
    private func handleLoggedInStatus() -> Bool {
        return isLoggedIn
    }
    
    private func reportNotInitializedFlutterError(result: FlutterResult) {
        result(FlutterError(
            code: "not_initialized",
            message: "Zendesk SDK needs to be initialized first",
            details: nil)
        )
    }

}
