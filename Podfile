# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'FuelTracker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FuelTracker
	pod 'SwiftLint'
	pod 'SQLite.swift', '~> 0.11.5'
	pod 'SwiftyMocky'

  target 'FuelTrackerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FuelTrackerUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  # Disable Code Coverage for Pods projects
  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
          end
      end
  end
end
