---
layout: post
section-type: post
title: "React Native Tamagotchi Game Part 3: Native Modules and Beta Testing"
category: "Mobile Dev"
tags: [ 'react native', 'mobile development', 'app development', 'game', 'navigation', 'animation' ]
---

##Updates

I've been wanting to finish this app as soon as possible, so I have been lagging
on updating this blog. Let me catch you up to speed. As of now, I have finished:

- adding Redux state to all necessary parts of the app (Pet and Backpack)
- finished the "item placement" mechanism which allows each item in the Store
to act an an independent hit-box sprite once placed into the Home screen from
the backpack
- added basic step counting and steps-to-in-game-currency translation
- added the BuddyBuild SDK to help with beta testing and publishing


### Native Modules for Step counting
In order to access Apple's HealthKit API, I decided to write my own native
module in Objective-C in order to learn how it works. After meticulous testing
and several Stack-Overflow searches, I found that the [HKStatisticsCollectionQuery]
(https://developer.apple.com/reference/healthkit/hkstatisticscollectionquery) is
the only query that updates "in real time" once it is called. What I mean is that
all I have to do to get the most up to date step count is:
 - create the query
 - add the initial results handler and the updated results handler
 - send an event from the native code to the JS side of things with the number
 of steps as the payload

For every other query I tried, I had to actually open the Apple Health app in
order for the step count to be updated. Must be some kind of quirk with the
HealthKit API, but I found something that works so I am going with it.

 The actual code for the native module was inspired by these helpful sources:
 - [Apple's Official Documentation](https://developer.apple.com/reference/healthkit/hkstatisticscollectionquery?language=objc)
 - [React Native's Official Documentation](https://facebook.github.io/react-native/docs/native-modules-ios.html#sending-events-to-javascript)
 - [How to Develop a Simple Step Counter App on ReactNative](https://dzone.com/articles/how-to-develop-a-simple-step-counter-app-on-reactn)
 - [This Stack-Overflow question](http://stackoverflow.com/questions/29708829/ios-healthkit-todays-step-count-is-always-0-but-trailing-days-are-ok)

### Beta Testing with [BuddyBuild](https://www.buddybuild.com)

Now that my app is coming to a point where I am comfortable to release it on
the app stores, I want to do some beta testing to work out all the bugs. I found
this service called [BuddyBuild](https://www.buddybuild.com) which works really
well with React Native apps.

I simply created an account, pointed BuddyBuild to
the iOS version of my app, logged in with my Apple Developer credentials, and
installed the BuddyBuild SDK alongside my app. Now, BuddyBuild handles all of the
certificate signing and provisioning for my beta testers. Even better, it allows
testers to take screenshots of bugs and **automatically creates a GitHub issue** for me
to look at. Also, it submits crash reports that point me to the exact line of code
that went wrong. All I have to do to get testers started is send them an email.

Now, I am using the free tier which only allows 5 screenshots a month, but it offers
unlimited crash reports and I can publish directly to the Google Play/Apple app
stores from the BuddyBuild dashboard.

### Next Steps
My next steps are to collect all the bug reports and finish ironing them out.
After that, I will publish to the Apple app store. Looking farther, I will work
on integrating Google Fit for the Android version as well as adding to the
game features in order to make the app more captivating such as some sort of
development of the pet or a crafting system or just something to make the game
more engaging and rewarding to play. I will also talk to some of my
art/digital design friends to see if they will make some sprites for me. So far,
I have just been using [opengameart.org](http://opengameart.org).

As always, you can find the [code for all this on my GitHub](https://github.com/MishaShapo/CaGif) as I am making the app open-source for everyone to learn from. :)
