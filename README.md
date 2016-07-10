# Material Loading Indicator

Some fun with `Core Animation` - making an Android-inspired, material loading indicator.

<p align="center">
<img src="Indicator.gif"</img>
</p>

This little project is based on a neat tutorial by Matthew Cheok on implementing an [Android-inspired, material-style loading indicator](http://blog.matthewcheok.com/design-teardown-spinning-indicator/), with some minor parameterization and re-factoring.

**Update:** Funny story: this harmless little project led to a very brief moment of Twitter celebrity. 

Soon after posting this playground, tweeted about an initialization technique I learned from persuing Erica Sadun's Github, which I used for my re-factoring of this project. Namely, you can initialize a Swift constant without having to use intermediate property declarations within the initializing closure. Instead, you can refer to the initialized property using positional references, like so:

```
   let strokeStartAnimation: CAAnimation = {
            
            $0.beginTime = tailDelay
            $0.fromValue = 0.0
            $0.toValue = 1.0
            $0.duration = tailDuration
            $0.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            return $0
            
        }(CABasicAnimation(keyPath: "strokeStart"))
```

It's a minor tweak, but makes the declaration a lot more elegant to read (and to type). Apparently, the iOS community thought so too - enough to get [re-tweeted](https://twitter.com/nick_skmbo/status/735109452827877377) over 100 times! In fact, it caused enough of a stir in the iOS-Twitterverse that within a day, [Natasha The Robot had written a whole blog post about it](https://www.natashatherobot.com/swift-configuring-a-constant-using-shorthand-argument-names/)!

Happy that everyone had fun with this tidbit. Makes me wonder how many of these little gems are still yet to be discovered (or popularized) as a result of a deeper understanding of the Swift language and its compiler.
