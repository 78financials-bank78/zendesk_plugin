import 'dart:io';

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
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<void> initialize({
    required String iosKey,
    required String androidKey,
  }) async {
    try {
      await methodChannel.invokeMethod('initialize', {
        'channelKey': Platform.isAndroid ? androidKey : iosKey,
      });
    } catch (e) {
      debugPrint('ZendeskError: Error - $e');
    }
  }

  @override
  Future<void> showMessaging() async {
    try {
      await methodChannel.invokeMethod('show');
    } catch (e) {
      debugPrint('ZendeskMessagingPlugin: Error - $e');
    }
  }

  @override
  Future<void> loginUser(String jwt) async {
    try {
      await methodChannel.invokeMethod('loginUser', {'jwt': jwt});
    } catch (e) {
      debugPrint('ZendeskError: Error - $e');
    }
  }
}
