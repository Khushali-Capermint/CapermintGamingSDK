Pod::Spec.new do |spec|

  spec.name         = "CapermintGamingSDK"
  spec.version      = "0.0.8"
  spec.summary      = "A CocoaPods library written in Swift for gaming SDK"

  spec.description  = <<-DESC
Gaming SDK integration library for different games integrated and useable to all users.
                   DESC

  spec.homepage     = "https://github.com/Khushali-Capermint/CapermintGamingSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Khushali Nimje" => "khushali@caperminttechnologies.com" }

  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/Khushali-Capermint/CapermintGamingSDK.git", :tag => "#{spec.version}" }
  spec.source_files  = "CapermintGamingSDK/**/*.{swift}"
  spec.resources = "CapermintGamingSDK/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

end

