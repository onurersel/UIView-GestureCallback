Pod::Spec.new do |s|
  s.name         	= 'UIView-GestureCallback'
  s.version      	= '0.0.1'
  s.authors 		= {'Onur Ersel' => 'onurersel@gmail.com'} 
  s.social_media_url = 'https://twitter.com/ethestel'
  s.license 		= { :type => 'MIT', :file => 'LICENSE' }
  s.homepage		= 'https://github.com/onurersel/UIView-GestureCallback'
  s.source 			= {:git => 'https://github.com/onurersel/UIView-GestureCallback.git', :tag => s.version}
  s.summary 		= "Category of block wrappers for UIGestureRecognizer's"

  s.ios.deployment_target = "6.0"

  s.requires_arc 	= true
  s.source_files 	= "UIView+GestureCallback.{h,m}"
end