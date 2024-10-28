Pod::Spec.new do |s|
  s.name         = "DzwEventRouter"
  s.version      = "0.0.9"
  s.summary      = "A lightweight event router for iOS applications."
  s.description  = <<-DESC
    DzwEventRouter enables flexible communication between different components in an iOS app through a target-action pattern.
  DESC

  s.homepage     = "https://github.com/Dtheme/DzwEventRouter"
  s.license 	 = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "zw.Duan" => "armchannel_dzw@163.com" }
  s.source       = { :git => "https://github.com/Dtheme/DzwEventRouter.git", :tag => s.version.to_s }
  s.ios.deployment_target = "13.0"
  s.source_files  = "DzwEventRouter/**/*.{h,m}"
end
