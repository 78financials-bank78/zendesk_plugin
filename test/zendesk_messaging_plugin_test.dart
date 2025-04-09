import 'package:flutter_test/flutter_test.dart';
import 'package:zendesk_messaging_plugin/zendesk_messaging_plugin.dart';
import 'package:zendesk_messaging_plugin/zendesk_messaging_plugin_platform_interface.dart';
import 'package:zendesk_messaging_plugin/zendesk_messaging_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZendeskMessagingPluginPlatform
    with MockPlatformInterfaceMixin
    implements ZendeskMessagingPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZendeskMessagingPluginPlatform initialPlatform = ZendeskMessagingPluginPlatform.instance;

  test('$MethodChannelZendeskMessagingPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZendeskMessagingPlugin>());
  });

  test('getPlatformVersion', () async {
    ZendeskMessagingPlugin zendeskMessagingPlugin = ZendeskMessagingPlugin();
    MockZendeskMessagingPluginPlatform fakePlatform = MockZendeskMessagingPluginPlatform();
    ZendeskMessagingPluginPlatform.instance = fakePlatform;

    expect(await zendeskMessagingPlugin.getPlatformVersion(), '42');
  });
}
