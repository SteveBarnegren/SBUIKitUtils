#
# Be sure to run `pod lib lint SBUIKitUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBUIKitUtils'
  s.version          = '0.1.0'
  s.summary          = 'A collection of UIKit utils and categories'

  s.description      = <<-DESC
My personal UIKit utilities library
                       DESC

  s.homepage         = 'https://github.com/steve.barnegren@gmail.com/SBUIKitUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'steve.barnegren@gmail.com' => 'steve.barnegren@gmail.com' }
  s.source           = { :git => 'https://github.com/steve.barnegren@gmail.com/SBUIKitUtils.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stevebarnegren'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SBUIKitUtils/**/*'
  s.frameworks = 'UIKit'
end
