# UIView-GestureCallback

Category of block wrappers for UIGestureRecognizers


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
- wrapper for UIRotationGestureRecognizer
- wrapper for UILongPressGestureRecognizer
- wrapper for custom gesture recognizers
- tests for GestureCallbackValues storage logic