Pod::Spec.new do |s|
    s.name         = "GoogleMaps"
    s.version      = "6.2.1-beta"
    s.summary      = "Google Maps SDK for iOS."
    s.description  = <<-EOS
    Use the Google Maps SDK for iOS to enrich your app with interactive maps, immersive Street View panoramas, and detailed information from Google's Places database.
    EOS
    s.homepage     = "https://developers.google.com/maps/documentation/ios/"
    s.license      = { :type => "Copyright", :text => "Copyright 2022 Google" }
    s.author             = "Google, Inc."
    s.ios.deployment_target = '12.0'
    s.source       = { :http => "https://dl.google.com/geosdk/GoogleMaps-6.2.1-beta.tar.gz" }
    s.default_subspec = 'Maps'
    s.swift_version = '5.3'
    s.cocoapods_version = '>= 1.4.0'
  
    s.subspec "Base" do |ss|
      ss.frameworks  = "CoreData", "CoreGraphics", "CoreLocation", "CoreText", "CoreTelephony", "QuartzCore", "SystemConfiguration", "UIKit"
      ss.libraries = 'c++', 'z'
      ss.vendored_frameworks = 'GoogleMapsBase.xcframework'
    end
  
    s.subspec "Maps" do |ss|
      ss.dependency "GoogleMaps/Base"
      ss.frameworks  = "Accelerate", "CoreImage", "CoreText", "GLKit", "ImageIO", "Metal", "OpenGLES", "QuartzCore"
      ss.vendored_frameworks = 'GoogleMaps.xcframework', 'GoogleMapsCore.xcframework'
      ss.resources = 'GoogleMaps.xcframework/**/Resources/GoogleMaps.bundle'
    end
  end