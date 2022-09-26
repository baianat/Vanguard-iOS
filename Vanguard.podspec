#
# Be sure to run `pod lib lint Vanguard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Vanguard'
  s.version          = '1.0.0'
  s.summary          = 'Vanguard is a validation tool for forms in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Vanguard is a validation tool for forms in Swift with a lot of customization and options
                       DESC

  s.homepage         = 'https://github.com/baianat/Vanguard-iOS.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Baianat' => 'development@baianat.com' }
  s.source           = { :git => 'https://github.com/baianat/Vanguard-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'Vanguard/Classes/**/*'
  s.resources = 'Vanguard/Assets/**/*'
  
  # s.resource_bundles = {
  #   'Vanguard' => ['Vanguard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
