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
    <%- content %>
  </body>
</html>
```

#Content

#Assets







#Scripts and styles for next section I think
