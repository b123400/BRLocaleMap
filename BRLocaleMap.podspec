Pod::Spec.new do |s|

  s.name         = "BRLocaleMap"
  s.version      = "1.0.0"
  s.summary      = "iOS/Mac library for mapping between Cocoa langauge codes (ISO639-1) to Google/Bing translate service"
  s.homepage     = "https://github.com/b123400/BRLocaleMap"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  
  s.author       = { "George Polak" => "b123400@gmail.com", :submodules => true }

  s.ios.platform = :ios, "5.0"
  s.osx.platform = :osx, "10.6"

  s.source       = { :git => "https://github.com/b123400/BRLocaleMap.git" }

  s.source_files = 'BRLocaleMap'
  s.resources    = 'locale-mapping/*.json'
  s.requires_arc = true

end
