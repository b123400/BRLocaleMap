Pod::Spec.new do |s|

  s.name         = "BRLocaleMap"
  s.version      = "1.0.1"
  s.summary      = "iOS/Mac library for mapping between Cocoa langauge codes (ISO639-1) to Google/Bing translate service"
  s.homepage     = "https://github.com/b123400/BRLocaleMap"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "b123400" => "b123400@gmail.com" }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.6"

  s.source       = { :git => "https://github.com/b123400/BRLocaleMap.git", :submodules => true, :tag => "1.0.1" }

  s.source_files = 'BRLocaleMap'
  s.resources    = 'locale-mapping/*.json'
  s.requires_arc = true

end
