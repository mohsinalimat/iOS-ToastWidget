
Pod::Spec.new do |s|
  s.name             = 'Toast'
  s.version          = '0.0.1'
  s.summary          = 'Toast widget on iOS platform'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
1. iOS version of android related toast view. Which supports icon, text, loading view display.
2. Current widget supports screen rotation
3. Auto adjust display height when keyboard pops
4. Highly customizable via view properties
                       DESC

  s.homepage         = 'https://github.com/SamuelZhaoY/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zy.zhao' => 'zhaoy.samuel@gmail.com' }
  s.source           = { :git => 'https://github.com/SamuelZhaoY/iOS-ToastWidget.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Toast/Classes/*'
  
  # s.resource_bundles = {
  #   'Toast' => ['Toast/Assets/*.png']
  # }

  s.public_header_files = 'Toast/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
