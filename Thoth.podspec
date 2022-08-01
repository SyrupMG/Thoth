#
# Be sure to run `pod lib lint Thoth.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Thoth'
  s.version          = '1.0.0'
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
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = {
    'tm' => 'TMalysheva@ctcmedia.ru',
    'abesmon' => 'abesmon@gmail.com'
  }
  s.source           = { :git => 'https://gitlab.ctcmedia.ru/mobiledev/Thoth.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.3'
  s.tvos.deployment_target = '10.3'
  s.swift_version = '5.0'

  s.default_subspecs = 'Core'
  
  s.subspec 'Core' do |ss|
    ss.source_files = 'Thoth/Core/*.swift'
  end
  
  s.subspec 'Firebase' do |ss|
    ss.source_files = 'Thoth/Firebase/*.swift'
    ss.dependency "Thoth/Core"
    ss.dependency "Firebase", '~> 8.8'
    ss.dependency "Firebase/Core"
    ss.ios.dependency "Firebase/Performance"
  end
  
  s.subspec 'AppsFlyerDynamic' do |ss|
    s.static_framework = true
    ss.source_files = 'Thoth/AppsFlyer/*.swift'
    ss.dependency "Thoth/Core"
    ss.dependency "AppsFlyerFramework/Dynamic", '~> 6.8'
  end
  
  s.subspec 'AppsFlyerStrict' do |ss|
    s.static_framework = true
    ss.source_files = 'Thoth/AppsFlyer/*.swift'
    ss.dependency "Thoth/Core"
    ss.dependency "AppsFlyerFramework/Strict", '~> 6.8'
  end
  
  s.subspec 'AppMetrica' do |ss|
    ss.source_files = 'Thoth/AppMetrica/*.swift'
    ss.dependency "Thoth/Core"
    ss.dependency "YandexMobileMetrica/Dynamic", '~> 4.2'
  end
end
