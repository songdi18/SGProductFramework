Pod::Spec.new do |s|  
  s.name             = “SGProductFramework”  
  s.version          = "1.0.0"  
  s.summary          = “IOS Base Framework”  
  s.description      = <<-DESC  
                       IOS Base Framework.
			DESC
  s.homepage         = "https://github.com/songdi18/SGProductFramework"  
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"  
  s.license          = 'MIT'  
  s.author           = { “宋迪” => “kratos18@163.com" }  
  s.source           = { :git => "https://github.com/songdi18/SGProductFramework.git", :tag => s.version.to_s }  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, ‘7.0’  
  # s.ios.deployment_target = '5.0'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  
  s.source_files = 'SGProductFramework/*'  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit’, ‘AFNetWorking’
  
end  
