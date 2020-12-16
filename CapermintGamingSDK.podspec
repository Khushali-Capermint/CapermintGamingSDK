Pod::Spec.new do |spec|

  spec.name         = "CapermintGamingSDK"
  spec.version      = "0.0.6"
  spec.summary      = "A CocoaPods library written in Swift for gaming SDK"

  spec.description  = <<-DESC
Gaming SDK integration library for different games integrated and useable to all users.
                   DESC

  spec.homepage     = "https://github.com/Khushali-Capermint/CapermintGamingSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Khushali Nimje" => "khushali@caperminttechnologies.com" }

  spec.ios.deployment_target = "14.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/Khushali-Capermint/CapermintGamingSDK.git", :tag => "#{spec.version}" }
  spec.source_files  = "CapermintGamingSDK/**/*.{swift}"
  spec.resource_bundles = {
    'CapermintGamingSDK' => ['CapermintGamingSDK/**/*.{xib,storyboard,xcassets}'] }
end

