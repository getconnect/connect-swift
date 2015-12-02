Pod::Spec.new do |s|

  s.name         = "Connect-Swift"
  s.version      = "0.0.1"
  s.summary      = "A declarative swift query language for Connect."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
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
  s.source_files  = "ConnectSwift/ConnectSwift/*.swift"

  s.requires_arc = true

  s.dependency 'Alamofire', '~> 3.1'

end
