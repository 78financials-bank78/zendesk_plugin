// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'zendesk_messaging_plugin_platform_interface.dart';

class ZendeskMessagingPlugin {
  // static const MethodChannel _channel = MethodChannel(
  //   'zendesk_messaging_plugin',
  // );

  static Future<void> initialize({
    required String androidKey,
    required String iosKey,
  }) async {
    if (androidKey.isEmpty || iosKey.isEmpty) {
      debugPrint(
        'Zendesk initialization failed - Messaging keys cannot be empty',
      );
      return;
    }
  }

  Future<String?> getPlatformVersion() {
    return ZendeskMessagingPluginPlatform.instance.getPlatformVersion();
  }
}
