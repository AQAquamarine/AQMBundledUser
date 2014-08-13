Pod::Spec.new do |s|
  s.name         = "AQMBundledUser"
  s.version      = "0.0.1"
  s.summary      = "User token and secret key for "
  s.description  = "Generate secure ra"
  s.homepage     = "https://github.com/AQAquamarine/AQMSecureRandom"
  s.license      = "MIT"
  s.author       = { "Aquamarine" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AQAquamarine/AQMSecureRandom.git", :tag => "v0.0.2" }
  s.source_files  = "SecureRandom/Classes/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
