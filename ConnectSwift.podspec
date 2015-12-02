
Pod::Spec.new do |s|

  s.name         = "ConnectSwift"
  s.version      = "0.0.1"
  s.summary      = "A declarative swift query language for Connect."
  s.description  = <<-DESC
                    Connect-Swift is a declarative query language for Connect.
                   DESC
  s.homepage     = "https://getconnect.io"
  s.license      = "MIT"
  s.author       = { "chadedrupt" => "chad@getconnect.io" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source       = { :git => "https://bitbucket.org/teamtipi/connect-swift.git", :tag => s.version }
  s.source_files = 'Pod/Classes/**/*'

  s.requires_arc = true

  s.dependency 'Alamofire', '~> 3.1'

end
