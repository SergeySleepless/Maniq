# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

use_frameworks!

target 'FirebaseService' do
	pod 'Firebase/Analytics'
	pod 'Firebase/Auth'
	pod 'Firebase/Firestore'
	pod 'Firebase/Database'
	pod 'Firebase/Functions'
	pod 'Sourcery'
end

target 'Maniq' do
	pod 'PhoneNumberKit'

	pod 'IQKeyboardManagerSwift'
	pod 'Validator'
	pod "VK-ios-sdk"
	pod 'Sourcery'
end

target 'ServicesCommon' do
	pod 'Sourcery'
end

target 'Login' do 
	pod 'PhoneNumberKit',
	pod "CBPinEntryView"
	pod 'Sourcery'
end

target 'LoginTests' do
  inherit! :search_paths
end

target 'FirebaseServiceTests' do
  inherit! :search_paths
end

target 'ManiqUI' do
	pod 'SwiftMessages'
	pod 'NVActivityIndicatorView'
	pod 'Sourcery'
end