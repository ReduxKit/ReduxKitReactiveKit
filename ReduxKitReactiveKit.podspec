Pod::Spec.new do |spec|
  spec.name              = 'ReduxKitReactiveKit'
  spec.version           = '0.1.0'
  spec.summary           = 'ReactiveKit bindings for ReduxKit'
  spec.homepage          = 'https://github.com/ReduxKit/ReduxKitReactiveKit'
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors           = { 'Aleksander Herforth Rendtslev' => 'kontakt@karemedia.dk', 'Karl Bowden' => 'karl@karlbowden.com' }
  spec.source            = { :git => 'https://github.com/ReduxKit/ReduxKitReactiveKit.git', :tag => spec.version.to_s }
  spec.source_files      = 'ReduxKitReactiveKit'
  spec.dependency          'ReduxKit', '~> 0.1'
  spec.dependency          'ReactiveKit', '~> 1.0'
  spec.ios.deployment_target     = '8.0'
  spec.osx.deployment_target     = '10.10'
  #spec.tvos.deployment_target    = '9.0'
  #spec.watchos.deployment_target = '2.0'
end
