Pod::Spec.new do |s|
  s.name             = 'Swiftional'
  s.version          = '2.0.0'
  s.summary          = 'Created for writing Swift code with a slight touch of functional programming.'

  s.description      = <<-DESC
  Swiftional introduce some functional primitives that complement the Swift standard library.
                       DESC

  s.homepage         = 'https://github.com/VAndrJ/Swiftional'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Volodymyr Andriienko' => 'vandrjios@gmail.com' }
  s.source           = { :git => 'https://github.com/VAndrJ/Swiftional.git', :tag => s.version.to_s }
  s.social_media_url  = 'https://www.linkedin.com/in/vandrj/'

  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '12.0'
  s.watchos.deployment_target = '5.0'
  s.osx.deployment_target = '10.14'

  s.source_files = 'Sources/Swiftional/*'

  s.swift_versions = '5.9'
end
