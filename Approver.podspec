Pod::Spec.new do |s|
s.name              = 'Approver'
s.version           = '1.2.0'
s.summary           = 'Use the Approver SDK to track and report events occured in your application.'
s.homepage          = 'https://api.approver.io'

s.author            = { 'Oleksandr Liashko' => 'oleksandr.liashko@corp.mailfire.io' }
s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

s.platform          = :ios
s.source            = { :git => 'https://github.com/Aleksansdr/Approver.git', :tag => 'v1.2.0' }

s.ios.deployment_target = '10.0'
s.ios.vendored_frameworks = 'Approver.framework'
end
