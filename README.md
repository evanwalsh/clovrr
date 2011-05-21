# Clovrr

I wanted a blogging app, so I made one. This is the in-development app. It uses Rails and MongoDB to make sweet, sweet blogging happen. Put your hands in the correct position and get ready.

## Features in/planned for v1

- Markdown-based text posting
- Link posts (to external sites)
- Archive listing of posts
- Theme support
- An API for exporting of posts

## Requirements for usage

- Ruby MRI 1.9.2 or its equivalent
- A server that can server Rails apps
- MongoDB
- A brain

## Installing

Clovrr was sort of designed to work on Heroku, but it could be installed most anywhere Rails 3 apps work otherwise.

Anyway, here's the _Heroku Way_.

1. Clone this repo (`git clone git://github.com/evanwalsh/clovrr.git`) or download its source code.
2. Install the Heroku gem (`gem install heroku`)
3. Make a new app on Heroku: `heroku create YOUR_APP_NAME --stack bamboo-mri-1.9.2`
4. Modify config/mongoid.yml if necessary (Clovrr will automatically work with Heroku and MongoHQ)
5. _(OPTIONAL)_ Modify db/seeds.rb
6. `git push heroku master`
7. `rake app:install`

**HEY BRO, YOU'RE DONE. WORD UP.**

## The future?

- A bookmarklet for posting
- Attachments to posts (that upload to S3)
- Location tagging of posts

## Contributing

_Shamelessly stolen from the Twitter gem's readme._

In the spirit of free software, everyone is encouraged to help improve this project.

Here are some ways you can contribute:

- by using the in-development version
- by reporting bugs
- by suggesting new features
- by writing or editing documentation
- by writing specifications
- by writing code (no patch is too small: fix typos, add comments, clean up inconsistent whitespace)
- by refactoring code
- by closing issues
- by reviewing patches

All contributors will be added to the README file and will receive the respect and gratitude of the community.

## Credits

Code by [Evan Walsh](http://evanwalsh.net)