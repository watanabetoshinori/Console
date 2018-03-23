Pod::Spec.new do |s|
  s.name = "Console"
  s.version = "1.0.0"
  s.license = "MIT"
  s.summary = "Console Screen for iOS Application"
  s.author = "Toshinori Watanabe"
  s.homepage = "https://github.com/watanabetoshinori/Console"
  s.source = { :git => "git@github.com:watanabetoshinori/Console.git", :tag => s.version }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/*.{h,swift}'

end
