#
# Be sure to run `pod lib lint Thoth.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Thoth'
  s.version          = '0.9.13'
  s.summary          = 'Simple Analytics service'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple Analytics service used in CTCMedia projects
                       DESC

  s.homepage         = 'https://gitlab.ctcmedia.ru/mobiledev/Thoth'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tm' => 'TMalysheva@ctcmedia.ru' }
  s.source           = { :git => 'https://gitlab.ctcmedia.ru/mobiledev/Thoth.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '10.0'

  s.source_files = 'Thoth/**/*.swift'

  s.dependency "Firebase"
  s.dependency "Firebase/Core"
  s.ios.dependency "Firebase/Performance"
  s.ios.dependency "YandexMobileMetrica/Dynamic"
  s.dependency "UserX" 
  s.tvos.dependency "YandexMobileMetrica/Dynamic-TV"
  s.dependency "AppsFlyerFramework"

  s.static_framework = true
  
  s.pod_target_xcconfig = {
      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Firebase $(PODS_ROOT)/FirebaseCore/Frameworks $(PODS_ROOT)/FirebaseRemoteConfig/Frameworks $(PODS_ROOT)/FirebaseInstanceID/Frameworks $(PODS_ROOT)/FirebaseAnalytics/Frameworks $(PODS_ROOT)/FirebaseABTesting/Frameworks'
  }
  s.pod_target_xcconfig = {
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }

end
