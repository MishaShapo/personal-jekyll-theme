---
layout: post
section-type: post
title: Title
category: "Mobile Dec"
tags: [ 'react native', 'mobile development', 'app development', 'game', 'navigation', 'animation' ]
---

## Navigation and Animation
I've made steady progress with my Tamagotchi mobile app. I've finished the
code for
- navigating between the 3 main screens (Home, Store, and Backpack)
- simple email-based Firebase authentication (tied with Redux state)
- a hitbox mechanic for the sprites
- animations for the Pet wellbeing stats (health, hunger, happiness)


### UI Development Problems
The most difficult part thus far has been UI development. For example, I was
debugging this weird behavior where the first TextInput component wasn't
receiving touch events. It turned out there was an invisible navbar on top of
the TextInput that prevented touch events from propagating to it. The solution?
**one, single CSS rule**

`
  marginTop: 65  
`

That simply moved the TextInput component below the invisible navbar (which I
still needed later), allowing touch events to propagate through.

And that took me all day to finally find. I'll be glad when I am done with the
UI components/animations and can focus on gameplay mechanics and connecting to
the HealthKit and Google Fit services.

## UI Development Solutions

I have become better at spotting these UI bugs though. Sometime, I put some CSS
border around the components I am debugging to make sure they are where I think
they are. Also, in my experience, for simple effects, just reference the React
Native documentation. For example, I wanted to have a "tooltip" effect for the
Pet wellbeing stats, I looked online for various tooltip libraries for React and
whether or not they are compatible with React Native. But, honestly, most of the
time they are overkill for one simple feature. In the end, I just used React
Native's Animated class along with some Animated.View, Text, and TouchableOpacity
components, following the example code on the Animated API docs.
And it worked beautifully.

**tl;dr**

Be confident in yourself that you can write beautiful code and you don't
have to rely on other libraries/people to get what you want.

In the meantime, I'll talk about several of the problems/solutions I came across
while implementing the features I have so far.

### Sprites with hitboxes

For the hitbox mechanic implementation, I wanted to have a hitbox that I could use for both interactions between sprites as well as repsonding to touch gestures so the user could 'drag-n-drop' their Pet.

I started by simply copying the Sprite code from
[react-game-kit](https://github.com/FormidableLabs/react-game-kit) and then
adding a hitbox prop (which was an object with 4 keys)

```
{
  left: 0,
  top: 0,
  width: 50,
  height: 50
}
```
I then added the [PanResponder event listeners](https://facebook.github.io/react-native/docs/panresponder.html) and used the hitbox dimensions in the [handleShouldSetPanResponder](https://facebook.github.io/react-native/docs/gesture-responder-system.html#responder-lifecycle) method to determine whether or not the Sprite should start responding to touch gestures.

Lastly, I added some checks in the [handlePanResponderMove](https://facebook.github.io/react-native/docs/panresponder.html) method to make sure to only move the sprite as long as the hitbox does not go offscreen.

The only tricky part in this was reading which touch coordinates to use (because there are lie 7 different global and local touch coordinates) and the sprite rendering mechanic. I realized that, internally, [react-game-kit](https://github.com/FormidableLabs/react-game-kit) uses CSS transforms to render a single frame from the spritesheet, but this also changes the relative coordinates of the touch event when a user presses on the hitbox. The solution was just to normalize the relative coordinates by modulating the touch coordinate x/y coordinate by the tileWidth/tileHeight respectively.

```
const { locationX, locationY } = e.nativeEvent;

const normalizedX = locationX % tileWidth;
const normalizedY = locationY % tileHeight;
```

##Moving Forward
Now, I just have to work on the grid views for the Store and Backpack screens as well as the modal for cashing in steps for in-game currency. After that, I can focus on fully adding all the game state to a Redux store. Then, I will finally get around to integrating HealthKit/Google Fit APIs to get the actual step counts.

As always, you can find the [code for all this on my GitHub](https://github.com/MishaShapo/CaGif) as I am making the app open-source for everyone to learn from. :) 
