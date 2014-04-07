#Assets

So far, so stark. Let's pretty this up.

##Blocks
Blocks are a way to add scripts, styles and meta elements
to our pages. The livereload plugin we installed earlier will rely on a block to
inject the scripts it needs. We will rely on the blocks to add our own
stylesheets and scripts.

Add three blocks to our default layout:
```html
<!DOCTYPE html>
  <head>
    <title><%= @document.title %> | My Awesome Website</title>
    <%- @getBlock("meta").toHTML() %>
    <%- @getBlock("styles").toHTML() %>
  </head>
  <body>
    <h1><%= @document.title %></h1>
    <h2>By <%= @document.author %></h2>
    <%- @content %>
    <%- @getBlock("scripts").toHTML() %>
  </body>
</html>
```

If we save that and reload our browser, the page now has the necessary scripts
for the livereload plugin to automatically refresh the browser when it detects a modification to our source. 

##Images
Let's verify the plugin is working by adding finding an image befitting our company and adding it to every page. Place the image in `files/images` and add an image tag to
the layout.
```html
<img src="/images/bourbon.jpg" alt="The Bourbon: A biscuit of distinction." />
```
then observe the change in the browser.

##Stylesheets
Now to add some style. Create a file `src/documents/styles/style.css.styl` and
write a couple of rules to modify our existing content:
```css
body
  color: #333
  font-family: "Helvetica Neue", "Helvetica", "Arial", "Comic Sans", sans-serif
  font-size: 1.3em
  text-align: center

h1
  color: #111

h2
  color: #666
```

To include our stylesheet in our pages we will need to update our styles block. Change the line in our template to:
```
<%- @getBlock("styles").add(["/styles/style.css"]).toHMTL() %>
```

##Scripts
The process for adding scripts is the same. Create files in `src/documents/scripts` and add them to the scripts block in the default layout.

TODO more here
