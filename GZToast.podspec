

Pod::Spec.new do |s|
  s.name             = 'GZToast'
  s.version          = '0.1.2'
  s.summary          = 'Toast widget on iOS platform'

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
  s.source_files = 'GZToast/Classes/*'
  s.public_header_files = 'GZToast/Classes/*.h'
end
