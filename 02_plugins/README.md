#Installing Plugins

DocPad is extensible by plugins. This gives us the flexibility to choose our
preferred markups and languages, meaning DocPad is language-agnostic. Which is
nice.
 
There are also plugins that add extra functionality, like live reloading in
development, pretty URLs, scheduling posts and all sorts of serious juju. 

You can find the complete listings of DocPad plugins in the [npm directory](https://www.npmjs.org/browse/keyword/docpad-plugin) or in the DocPad's own [documentation](http://docpad.org/docs/plugins).

The command for installing a plugin is 
```
docpad install #{thePluginName}
```

For my examples I will be using the Eco templating language, CoffeeScript for JavaScript, and Stylus for pimping CSS. You could as easily follow along with your preprocessors of choice, or vanilla CSS.

I will also be using the livereload plugin so DocPad can listen for changes to
our code and reload our site in the browser without our needing to refresh.

```
docpad install eco
docpad install coffeescript
docpad install stylus
docpad install livereload
docpad install marked
```

If there is a way to feed the docpad install command multiple arguments I
haven't found it yet. Plugins are installed on a per project basis, and
uninstalling is simply 
```
docpad uninstall #{thePluginName}
```
