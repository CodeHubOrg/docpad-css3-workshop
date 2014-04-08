# DocPad Configuration File
# http://docpad.org/docs/config

docpadConfig = {
  templateData:
    site:
      title: "BISCuITS"
      author: "Mr. Biscotti"

    getPreparedTitle: -> 
      if @document.title then "#{@document.title} | #{@site.title}" else @site.title

  collections:
    pages: ->
      @getCollection("documents").findAllLive({isPage:true}).on "add", (model) ->
        model.setMetaDefaults({layout:"default"})

    posts: ->
      @getCollection('documents').findAllLive({relativeOutDirPath:'blog'},[date:-1])
}

# Export the DocPad Configuration
module.exports = docpadConfig
