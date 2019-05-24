# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def common_pods
  pod 'Alamofire'
  pod 'Reachability'
end


target 'BioBeatsApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BioBeatsApp
  common_pods

  target 'BioBeatsAppTests' do
    inherit! :search_paths
    # Pods for testing
    common_pods
  end

  target 'BioBeatsAppUITests' do
    inherit! :search_paths
    # Pods for testing
    common_pods
  end

end
