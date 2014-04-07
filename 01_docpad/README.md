#Installing DocPad

Update the Node Package Manager.
```
npm update -g npm
```

Install DocPad
```
npm install -g docpad
```

Neither of these commands should require 'sudo'. If you find that you require
sudo to run them it is likely you will continue to encounter permissions
problems in the future. You might consider reinstalling Node.js to fix this.

To upgrade DocPad
```
docpad update
```


These instructions are closely modelled on DocPad's own [installation
guide](http://docpad.org/docs/install). If you run into any difficulties the
best place to consult is the DocPad [troubleshooting guide](http://docpad.org/docs/troubleshoot).

#Our First DocPad Site

To verify our installation was successful we will create a new project with the standard structure:
```
mkdir codehub-docpad
cd codehub-docpad
docpad run
```

The first time you run DocPad you will be asked to agree to a terms of service.
This does not chime very well with the project's open source credentials, but is
I suppose comparable to the implicit terms of service in other open source
software such as WordPress. You can view the terms of service at http://bevry.me/tos. 
TL;DR Don't do anything you wouldn't want your grandmother to know about.

To help you get set up quickly DocPad offers a number of skeleton and example projects with
tools like Bootstrap and Foundation set up from the get go. For now select `No
Skeleton`, which will set up a project with the standard directory structure.
The `docpad run` command also starts a web server on http://localhost:9778. 

You can stop the server by pressing `CTRL + C`
