#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zendesk_messaging_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zendesk_messaging_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A Flutter for Zendesk Chat support.
                       DESC
  s.homepage         = 'https://github.com/maroafenogho/zendesk_messaging_plugin'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Oghenemaro Afenogho' => 'maroafenogho@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZendeskSDKMessaging', '2.30.1'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
   s.cocoapods_version = '>= 1.10.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'zendesk_messaging_plugin_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
