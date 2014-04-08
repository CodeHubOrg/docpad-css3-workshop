#Configuration

Take a look at the file `docpad.coffee` that DocPad created for us.

There are two sections - a JSON object and a line that exports them 
where we will define template data, helper
methods, plugin configuration and environment configuration.

```javascript
#Define the Configuration
docpadConfig = {
    # ...
}

# Export the Configuration
module.exports = docpadConfig
```

Note that by default this is a CoffeeScript file, but additional valid formats
are CSON(CoffeeScript Notation Object), JavaScript, JSON. The nice thing about
using a CoffeeScript or JavaScript format is that we can declare functions. 

Let's set up some general properties for our site. Modify your `docpad.coffee`
file to look like this:

```coffeescript
docpadConfig = {
  templateData:
    site:
      title: "BISCuiTS"
      author: "Mr. Biscotti"
}

module.exports = docpadConfig
```

This makes the values @site.title and @site.author available for use in your
templates.

Now add the following to the DocPad config object:

```coffeescript
collections:
  pages: ->
    @getCollection("documents").findAllLive({isPage:true}).on "add", (model) ->
      model.setMetaDefaults({layout:"default"})

  posts: ->
    @getCollection('documents').findAllLive({relativeOutDirPath:'blog'},[date:-1])
```

Here we have told DocPad that any files we in our documents or render folder on
which we have set an isPage attribute in the metadata to be true should be
rendered using the default layout. Thus we can omit the layout attribute from
the metadata. Similarly, any files in a directory `blog` within our documents
folder will be sorted by date, in this case reverse chronological order.

Now let's make a template helper. The titles in our website could be better. We
have the line `<%= @document.title %> | My Awesome Website</title>` in our
default layout. This means that if we forget to set the title attribute on any
of our pages the title will be ` | My Awesome Website`. Not ideal.

Add the following method to the DocPad config file:

```coffeescript
getPreparedTitle: -> 
  if @document.title then "#{@document.title} | #{@site.title}" else @site.title
```

Now we can use this function in our default template. Just swap the `<title></title>` tag for 
```html
<title><%= @getPreparedTitle() %></title>
```

All of the available configuration option can be viewed at http://docpad.org/docs/config
