#Templates

In the `src` directory there are `documents`, `files`, and `layouts`. This
enforces a separation of concerns. Anything we would like DocPad to render, our content and our scripts goes in `documents`. Static files like images belong in `files`. The templates that describe how we would like our content to be laid out go, perhaps unsurprisingly, in `layout`.

Let's kick off by making a default layout for our site. Create a file in the
layouts folder and call it `default.html.eco`. DocPad's file extension convention
will be familiar if you have used Rails. By naming our file `.html.eco` we are
asking DocPad to render from eco to html. Similarly a file suffix `.js.coffee`
would denote compilation of CoffeeScript to JavaScript. Extensions can be
combined in to any logical order, so long as the requisite plugins are there to
support it. An extension `.html.md.eco` would render from Eco to Markdown to
HTML. Though Frankensuffixes like that should probably give you pause for
thought.

Place the following content in your new `default.html.eco`:

```html
<!DOCTYPE html>
  <head>
    <title><%= @document.title %> | My Awesome Website</title>
  </head>
  <body>
    <h1><%= @document.title %></h1>
    <h2>By <%= @document.author %></h2>
    <%- @content %>
  </body>
</html>
```

This code will function as a wrapper for our content. Notice the difference between the eco snippets for displaying the title and the content. The <%= %> will escape the data we feed it before outputting, which lets us use special characters, whereas <%- %> will not do any escaping, so we can feed it markup.

We can have as many or as few templates as we like, and templates can reference or import other templates. 

#Content

Now we have a template for layout let's make some content for it to play with.
Create two files in the `documents` folder - `index.html` and `about.html`.
Copy the following content (or write your own, following the same structure) in
to `index.html`:

```html
---
layout: "default"
title: "Welcome to Bob's Biscuit Bazaar"
author: "Robert 'Rich-Tea' Thumpston"
---

<p>Welcome to Bob's Biscuit Bazaar, supplier of lifestyle biscuits to the rich
and famous.</p>

<p><a href="<%= @site.url %>/about.html">About Us</a></p>
```

and in `about.html`
```html
---
layout: "default"
title: "From Animal Crackers to Zuckercookies, nobody knows biscuits like we knows biscuits."
author: "Robert 'Rich-Tea' Thumpston Jnr."
---

<p>Don't be fooled by imposters. Only Bob's Biscuit Bazzaar can be counted on
for high-end flour-based food products.</p>

<p>Whether it's snickerdoodles, stroopwafels or shortbread, we have you
covered.</p>

<p>By appointment to HRH Queen Latifah.</p>

```

You will notice that both these documents have two parts. The first, delineated
by three hyphens at either end, is the document's metadata. This is where we
store information about the document that can be used by DocPad, or for our own purposes. Any property defined in our metadata will be accessible to our templates. We have specified "default" as the value for the layout attribute so DocPad will know that we want to render this content using the default template.

The second part is the document's content, which can be anything we like.
As long as we like HTML. If we installed the requisite plugins we could write in
Markdown, or Textile, or HAML or just about anything. 


Now if we start the server with `docpad run` and navigate to [http://localhost:9778] in our browser, we should see the index page we just created. Nifty, huh?


#Assets

So far, so stark. Let's pretty this up.

##Blocks
Blocks are a way to add scripts, styles and meta elements
to our pages. The livereload plugin we installed earlier will rely on a block to
inject the scripts it needs. We will rely on the blocks to add our own
stylesheets and scripts.

Add three blocks to our default layout:
```
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
```
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
