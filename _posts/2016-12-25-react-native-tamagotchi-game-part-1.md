---
layout: post
section-type: post
title: "React Native Tamagotchi Game Part 1: Overview"
category: "Mobile Dev"
tags: [ 'react native', 'mobile development', 'app development', 'game' ]
---

![Screenshot of the app homescreen with the pet kitty]({{site.baseurl}}/img/post_assets/react_native_tamagotchi_part_1_1.png)

## A Tamagotchi Mobile Health Game
I am writing a series a blog posts as I develop a **Tamagotchi mobile app** for both
the iOS and Android platforms using **React Native**. My hackathon team and I began
this project during the HackTX 2016 hackathon. Now, I am going to finish the
basic functionality and add improvements while writing about the challenges that
I come across and solutions that I create.

### Exercise Through Gameplay
We wanted to encourage users to exercise through the use of the Tamagotchi game
mechanic, so our idea was to create a Tamagotchi game where the in-game currency
is earned through **fitness goals** such as walking a certain number of steps every
day.

React Native was the tool of choice because we wanted to learn something new
:smile:.

### App Features/Objectives
Here is a short list of features I aim to implement:
- sprites and fluid animations
- inventory and in-game currency
- Google Fit (Android) and HealthKit(iOS) integration
- social media sharing

Don't let the brevity of the list fool you, there is a lot of code behind those
words. The health service integration alone will require platform-specific
**native modules** in order to properly monitor step count data.

### Resources and Source Code
[The brainstorm Google Doc where we listed our ideas and a more detailed game
plan can be found here.](https://docs.google.com/document/d/1XXtubhBKlR5JvvtlSlyr_PrJBh7xqbmXO05mPkWXf5s/edit?usp=sharing)

[The GitHub repository for the app can be found here.](https://github.com/MishaShapo/CaGif)

Thank you for reading. Check back in soon, and I will share more about how we
made this app.
