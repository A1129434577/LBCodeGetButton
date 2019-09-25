Pod::Spec.new do |spec|
  spec.name         = "LBCodeGetButton"
  spec.version      = "0.0.1"
  spec.summary      = "获取验证码的Button"
  spec.description  = "获取验证码的Button，支持自定义倒计时、自定义默认title。"
  spec.homepage     = "https://github.com/A1129434577/LBCodeGetButton"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "刘彬" => "1129434577@qq.com" }
  spec.platform     = :ios
  spec.ios.deployment_target = '8.0'
  spec.source       = { :git => 'https://github.com/A1129434577/LBCodeGetButton.git', :tag => spec.version.to_s }
  spec.source_files = "LBCodeGetButton/**/*.{h,m}"
  spec.requires_arc = true
end
