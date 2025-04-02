# CircleProgrammableWalletSDK_static.podspec (Modified for Static Linking Fix)
Pod::Spec.new do |s|
  s.name = 'CircleProgrammableWalletSDK_static'
  s.version = '1.1.9' # Keep original version base
  s.license = 'Apache License, Version 2.0'
  s.summary = 'CircleProgrammableWalletSDK for iOS (Static Linking Fix).' # Updated summary
  s.homepage = 'https://www.circle.com/web3-services'
  s.author = 'CIRCLE'
  # Source will point to your fork when used in the main Podfile
  s.source = { :git => "URL_TO_YOUR_FORKED_REPOSITORY", # Placeholder
               :tag => '1.1.9-staticfix' } # Example tag

  s.platform = :ios, '13.0'
  s.swift_versions = ['5']
  s.cocoapods_version = '>= 1.12.0'

  # --- Static Linking Configuration ---
  # 1. Remove the problematic vendored_frameworks line
  # s.ios.vendored_frameworks = 'Source/static/CircleProgrammableWalletSDK.xcframework' # REMOVED

  # 2. Preserve the path so files are available
  s.preserve_paths = 'Source/static/CircleProgrammableWalletSDK.xcframework/**/*'

  # 3. Tell Cocoapods where to find the framework for linking
  s.xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/CircleProgrammableWalletSDK_static/Source/static"'
  }

  # 4. Explicitly point to the binaries within the xcframework for static linking
  #    CocoaPods needs the paths relative to the podspec file location.
  #    Update these paths if your fork's structure is different.
  s.vendored_libraries = [
    'Source/static/CircleProgrammableWalletSDK.xcframework/ios-arm64_x86_64-simulator/CircleProgrammableWalletSDK.framework/CircleProgrammableWalletSDK',
    'Source/static/CircleProgrammableWalletSDK.xcframework/ios-arm64/CircleProgrammableWalletSDK.framework/CircleProgrammableWalletSDK'
  ]
  # --- End Static Linking Configuration ---

  # Keep resource bundles if needed by the SDK
  s.resources = 'Resources/*.bundle'

  # Keep this - indicates the pod target itself is static
  s.static_framework = true

  # --- Dependencies ---
  # Keep direct dependencies AND add necessary transitive ones, pinning versions.
  s.dependency 'GoogleSignIn', '= 7.1.0'
  s.dependency 'FBSDKLoginKit', '= 17.0.2'
  # Add transitive dependencies required by the above versions:
  s.dependency 'AppAuth', '= 1.7.3'
  s.dependency 'GTMAppAuth', '= 2.0.0'
  s.dependency 'GTMSessionFetcher', '= 3.3.0'
  s.dependency 'FBSDKCoreKit', '= 17.0.2' # Required by FBSDKLoginKit

end
