# FBchan
FBchan is a web-based Facebook client that makes your news stream look like 4chan. It's fully skinnable, and can easily make your news stream look like any other social network or web site. Currently, there is a Twitter theme in addition to the default 4chan. Other than looking awesome, it doesn't actually do very much.

It's built as a single-page web app that uses Facebook's JS API, so it can be hosted anywhere as a static set of HTML/CSS/JS files. For example, http://lazerwalker.com/fbchan is hosted by GitHub Pages.


# Use it!
You can check out a live copy of FBchan at <http://lazerwalker.com/fbchan>.


# Running your own instance on GitHub Pages
1. Fork this codebase on GitHub.
2. Set up a Facebook application at <https://developers.facebook.com/apps>
2. In line 23 of javascripts/fb.coffee, replace the app ID with the app ID for your newly created app.
2. Your copy of FBchan should be live at http://<your-github-username>.github.com/fbchan


# Adding new themes
If you want to add a new theme, it's easy.

1. Create a new folder inside 'templates'
2. In main.coffee, line 20 specifies a list of valid templates. Add the name of your new templates folder to that array
3. There are a number of HTML template files you can create inside the root of your new template directory. All are optional (if you don't want to include a user panel, etc) and will accept [Mustache](http://mustache.github.io/) templates:
	* site.html: The body of the page
	* stylesheets.html: A series of <link> tags to include any stylesheets you may want to use
	* post.html: A news stream item (passed in a Post model)
	* comment.html: A comment on a news stream item (passed in a Comment model)
	* like.html: A like on a news stream item (passed in a Like model)
	* loading.html: A loading screen to be displayed while the initial content is loading
	* inlineLoading.html: A loadig indicator to be displayed above the stream while content is refreshing
	* user.html: A panel with information on the logged-in user (passed in a User object)

…and that's it!


# Contributing
If you make any changes to the codebase, you'll need to make sure the changes are merged into the gh-pages branch in order for GitHub Pages hosting to work.

Sadly, there are no tests. I know, I know.


# License
MIT License. See the LICENSE file for more info.
