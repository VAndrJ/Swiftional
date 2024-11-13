Pod::Spec.new do |s|
  s.name             = 'Swiftional'
  s.version          = '3.0.0'
  s.summary          = 'Created for writing Swift code with a slight touch of functional programming.'

  s.description      = <<-DESC
  Swiftional introduce some functional primitives that complement the Swift standard library.
                       DESC

  s.homepage         = 'https://github.com/VAndrJ/Swiftional'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Volodymyr Andriienko' => 'vandrjios@gmail.com' }
  s.source           = { :git => 'https://github.com/VAndrJ/Swiftional.git', :tag => s.version.to_s }
  s.social_media_url  = 'https://www.linkedin.com/in/vandrj/'

  s.ios.deployment_target = '13.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.osx.deployment_target = '11'
  s.visionos.deployment_target = '1.0'

  s.source_files = 'Sources/Swiftional/*'

  s.swift_versions = '6.0'
end
