#
# Be sure to run `pod lib lint JRMFloatingAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JRMFloatingAnimation"
  s.version          = "0.1.3"
  s.summary          = "A floating animation that can be used for bubbles, clouds, music notes, or whatever your heart desires."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
 Animation used to create "floating" UIImageViews, similar to the love animation in the Periscope app. Done via UIBezierPath and CAKeyframeAnimation.
                       DESC

  s.homepage         = "https://github.com/carleihar/JRMFloatingAnimation"
  s.screenshots     = "http://i.imgur.com/qK2cqsA.gif", "http://i.imgur.com/8NPeUXq.gif", "http://i.imgur.com/0yiav9V.gif", "http://i.imgur.com/2BOmIcQ.gif"
  s.license          = 'MIT'
  s.author           = { "Caroline Harrison" => "caroline@jackrabbitmobile.com" }
  s.source           = { :git => "https://github.com/carleihar/JRMFloatingAnimation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/carleihar'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#    'JRMFloatingAnimation' => ['Pod/Assets/*.png']
#}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
