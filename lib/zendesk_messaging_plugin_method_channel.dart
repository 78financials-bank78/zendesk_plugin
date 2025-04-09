import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zendesk_messaging_plugin_platform_interface.dart';

/// An implementation of [ZendeskMessagingPluginPlatform] that uses method channels.
class MethodChannelZendeskMessagingPlugin
    extends ZendeskMessagingPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = MethodChannel("zendesk_messaging_plugin");

  @override
  Future<String?> getPlatformVersion() async {
    print(('OPOPLLL""'));
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
