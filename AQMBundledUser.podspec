Pod::Spec.new do |s|
  s.name         = "AQMBundledUser"
  s.version      = "0.0.1"
  s.summary      = "User token and secret key tied to each installation."
  s.description  = "Generate secure secret key and user token UUID for each installation."
  s.homepage     = "https://github.com/AQAquamarine/AQMBundledUser"
  s.license      = "MIT"
  s.author       = { "Aquamarine" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AQAquamarine/AQMBundledUser.git", :tag => "v0.0.1" }
  s.source_files  = "Classes/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
