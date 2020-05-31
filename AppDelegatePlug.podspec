#
# Be sure to run `pod lib lint AppDelegatePlug.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppDelegatePlug'
  s.version          = '1.0.0'
  s.summary          = 'Let us make the AppDelegate Pluggable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Using AppDelegatePlug you separate AppDelegate from the services that you can plug to it. Each DelegatePlug has its own life cycle that is shared with AppDelegate.
                       DESC

  s.homepage         = 'https://github.com/MKHGLab/AppDelegatePlug'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Md. Kamrul Hasan' => 'mkhglab@gmail.com' }
  s.source           = { :git => 'https://github.com/mkhglab@gmail.com/AppDelegatePlug.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'

  s.source_files = 'AppDelegatePlug/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AppDelegatePlug' => ['AppDelegatePlug/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
