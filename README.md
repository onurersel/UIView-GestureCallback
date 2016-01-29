# UIView-GestureCallback

Category of block wrappers for UIGestureRecognizers


### Installation

Copy UIView-GestureCallback.h and UIView-GestureCallback.m files to your project. Or use Cocoapods

	pod 'UIView-GestureCallback'

### Usage


```objc 
#import "UIView+GestureCallback.h"
```

```objc 
// Adding tap recognizer
[view addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer) {
    //...
}];

// Remove tap recognizer without storing recognizer object, or looping through .gestureRecognizers array
[view removeTapGestureRecognizer];
```

### Todo
- wrapper for custom gesture recognizers
- tests for GestureCallbackValues storage logic