import UIKit
import XCPlayground
/*:
# Material Design Loading Indicator
## Some fun with `Core Animation`.
 
This playground is a translation of a great tutorial by [Matthew Cheok](http://blog.matthewcheok.com/design-teardown-spinning-indicator/) into Swift Playground format, with some minor refactoring and parameterization.
 
## Setup
### Sizing and Placement
 For presentation purposes, let's give the loading indicator a large container view within which we'll center it.
*/
let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
let loadingIndicatorDimension = containerView.bounds.width * 0.6
let loadingIndicator = LoadingIndicatorView(frame: CGRect(x: 0, y: 0, width: loadingIndicatorDimension, height: loadingIndicatorDimension))
loadingIndicator.center = containerView.center
containerView.addSubview(loadingIndicator)
/*:
## Behavior
 Here are the exposed properties of our loading indicator. Tweak to your heart's content and re-start the playground to view how the various parameters affect the results.
 
 *Tip*: Try toggling `rotates` to `false` to inspect how the head and tail animations affect the appearance of the loading indicator independent of the layer's rotation.
*/
loadingIndicator.lineWidth = 8.0

loadingIndicator.indicatorColor = UIColor.yellowColor()

loadingIndicator.headDuration = 1.0

loadingIndicator.tailDelay = 0.3

loadingIndicator.tailDuration = 1.0

loadingIndicator.rotates = true

loadingIndicator.rotationDuration = 2.0

loadingIndicator.animate()

XCPlaygroundPage.currentPage.liveView = containerView

/*: 
 
## Other Resources
 
 A couple of cool additional resources worth sharing:
 
 [Animations Explained - Objc.io](https://www.objc.io/issues/12-animations/animations-explained/)
 Great article with many links to several other resources on the subject of `Core Animation`.
 
 [Awesome Swift Playgrounds - uraimo](https://github.com/uraimo/Awesome-Swift-Playgrounds#animations)
 Compilation of numerous Swift playgrounds, including a few animation-related ones. As a huge fan of the game, I do appreciate the `Duet-Inspired Trail Effect` playground. (Oh, and if you haven't heard of or played Duet, check it out. Also, the soundtrack by Tim Shiel is absolutely magical.)
 
*/