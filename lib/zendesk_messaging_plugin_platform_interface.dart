import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zendesk_messaging_plugin_method_channel.dart';

abstract class ZendeskMessagingPluginPlatform extends PlatformInterface {
  /// Constructs a ZendeskMessagingPluginPlatform.
  ZendeskMessagingPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZendeskMessagingPluginPlatform _instance =
      MethodChannelZendeskMessagingPlugin();

  /// The default instance of [ZendeskMessagingPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelZendeskMessagingPlugin].
  static ZendeskMessagingPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZendeskMessagingPluginPlatform] when
  /// they register themselves.
  static set instance(ZendeskMessagingPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initialize({required String iosKey, required String androidKey});

  Future<void> showMessaging();
}
