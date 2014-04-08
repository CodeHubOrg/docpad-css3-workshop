#CSS Animations

If there's one thing the owner of Bob's Biscuit Bazaar knows, it's what his customers want from a luxury biscuit emporium. And what they want is pizzazz. How is he supposed to keep up with his competitors when nothing on his website *pops*? This is no place for subtlety. What Bob wants is that wow factor. And he wants it cheap.

Remove the image tag from the default layout and replace it with the following:
```html
<div id="object" class="animate"></div>
```

Then add the following to `src/documents/styles/styles.css.styl`:
```css
#object
  background-image: url("../images/custard_cream_prince_of_biscuits.png")
  background-repeat: no-repeat
  background-size: 100% 100%
  height: 367px
  margin: auto
  width: 464px

@keyframes pulse
  0%
    -webkit-transform scale(1.0) rotate(0deg) translateX(0%) translateY(0%)
  17%
    -webkit-transform scale(0.5) rotate(-145deg) translateX(70%) translateY(-30%)
  22%
    -webkit-transform scale(2) rotate(-10deg) translateX(15%) translateY(-10%)
  66%
    -webkit-transform scale(1.3) rotate(145deg) translateX(-45%) translateY(-50%)
  100%
    -webkit-transform scale(1.0) rotate(0deg) translateY(0%)

@keyframes disco
  0%
    background-color: yellow
  50%
    background-color: pink
  100%
    background-color: yellow

body
  animation: disco 15s infinite
  -webkit-animation: disco 15s infinite

.animate 
  animation: pulse 5s infinite
  -webkit-animation: pulse 5s infinite
```

This. Just, this. Now we're talking Bob's language. Your challenge, should you
choose to accept it, is to use the new CSS3 animation rules to build the most 
dynamic biscuit dealership website the world has ever seen. Bob wants his eyes
to hurt.

There are just 2 rules. Number 1 - no JavaScript. Number 2 - no Flash. I have
prepared a liberally commented repo with lots of examples of transitions, 2D transforms and 3D
transforms. You can find it at https://github.com/CodeHubOrg/css-animations/.
Download it, have a look, and feel free to borrow from it. Another useful tool
is Eric Meyer's compass-animate. This will necessitate your installing the DocPad Compass
plugin.

#Alternatively
If you are more interested in  DocPad than CSS3 animations, a different path
you might take is to implement a simple blog in DocPad. Start by making a new
layout for posts. You may also want to consult the DocPad [documentation](http://docpad.org). There is an excellent beginner's guide, which this workshop mirrors a little more closely than I intended(!), which goes in to more detail.

#A Note on Browser Support

Browser support for the new rules is still a little patchy. The examples on this
page and in the supporting files will work best in Chrome.

#A Note on Deployment

Instructions for deployment on various platforms can be found in the DocPad documetation - http://docpad.org/docs/deploy.
