#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "StoreKitClient"
  s.version                 = "0.5.0"
  s.summary                 = "Simple PromiseKit based client for Apple's StoreKit IAP API."
  s.homepage                = "https://github.com/dclelland/StoreKitClient"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/StoreKitClient.git", :tag => "0.5.0" }
  s.platform                = :ios, '8.0'
  s.ios.deployment_target   = '8.0'
  s.ios.source_files        = 'Sources/**/*.swift'
  s.requires_arc            = true
  
  s.dependency 'PromiseKit', '~> 6.4.0'
end
