Pod::Spec.new do |s|
  s.name         = "DzwEventRouter"                    # 库的名称
  s.version      = "0.0.9"                              # 版本号
  s.summary      = "DzwEventRouter is a lightweight event routing utility for iOS applications. " # 简短描述
  s.description  = <<-DESC
  It enables flexible communication between different components through a target-action pattern, making it easier to handle custom events.
  DESC

  s.homepage     = "https://github.com/username/DzwEventRouter" # 仓库主页链接
  s.license      = { :type => "MIT", :file => "LICENSE" } # 许可证类型和文件路径
  s.author       = { "zw.Duan" => "armchannel_dzw@163.com" } # 作者信息
  s.source       = { :git => "https://github.com/Dtheme/DzwEventRouter.git", :tag => s.version.to_s } # 源代码位置

  s.ios.deployment_target = "12.0"     # 最低支持的 iOS 版本
  s.source_files  = "DzwEventRouter/DzwEventRouter" # 代码文件路径，可以是文件夹或特定路径模式
  s.exclude_files = ""  # 如果有不包含的文件或文件夹
  s.resources     = ""   # 包含的资源文件（如图片、xib）

end

