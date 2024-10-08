<p align="center">
  <a href="https://www.practitest.com/api-v2/"><img src="https://www.practitest.com/wp-content/uploads/2012/07/PractiTest-Logo-small-300x68.png" alt="PractiTest API V2 Documentation"></a>
</p>

<p align="center" style="padding-bottom:30px;"><em>Checkout the full <a href="https://www.practitest.com/api-v2/">PractiTest API Documentation here</a>.</em></p>

<hr/>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Slate: API Documentation Generator" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Slate helps you create beautiful, intelligent, responsive API documentation.</p>

<p align="center"><em>The example above was created with Slate. Check it out at <a href="https://lord.github.io/slate">lord.github.io/slate</a>.</em></p>

Features
------------

* **Clean, intuitive design** — With Slate, the description of your API is on the left side of your documentation, and all the code examples are on the right side. Inspired by [Stripe's](https://stripe.com/docs/api) and [Paypal's](https://developer.paypal.com/webapps/developer/docs/api/) API docs. Slate is responsive, so it looks great on tablets, phones, and even in print.

* **Everything on a single page** — Gone are the days when your users had to search through a million pages to find what they wanted. Slate puts the entire documentation on a single page. We haven't sacrificed linkability, though. As you scroll, your browser's hash will update to the nearest header, so linking to a particular point in the documentation is still natural and easy.

* **Slate is just Markdown** — When you write docs with Slate, you're just writing Markdown, which makes it simple to edit and understand. Everything is written in Markdown — even the code samples are just Markdown code blocks.

* **Write code samples in multiple languages** — If your API has bindings in multiple programming languages, you can easily put in tabs to switch between them. In your document, you'll distinguish different languages by specifying the language name at the top of each code block, just like with Github Flavored Markdown.

* **Out-of-the-box syntax highlighting** for [almost 100 languages](http://rouge.jneen.net/), no configuration required.

* **Automatic, smoothly scrolling table of contents** on the far left of the page. As you scroll, it displays your current position in the document. It's fast, too. We're using Slate at TripIt to build documentation for our new API, where our table of contents has over 180 entries. We've made sure that the performance remains excellent, even for larger documents.

* **Let your users update your documentation for you** — By default, your Slate-generated documentation is hosted in a public Github repository. Not only does this mean you get free hosting for your docs with Github Pages, but it also makes it simple for other developers to make pull requests to your docs if they find typos or other problems. Of course, if you don't want to use GitHub, you're also welcome to host your docs elsewhere.

Getting started with Slate is super easy! Simply fork this repository and follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](http://lord.github.io/slate).

Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.0 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on Github.
2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

Deployment -- OLD
---------------------------------

```shell
#building:
bundle exec middleman build

#from clean
bundle exec middleman build --clean

#deploy
bundle exec middleman deploy

#or:
bundle exec middleman deploy --build-before
```

## Build

```shell
bundle exec middleman build --clean

# OR create the file via docker
docker build -t myimage . && docker run --name api_doc myimage && docker cp api_doc:/myapp/build/index.html ./build/ && docker stop api_doc && docker rm api_doc

# OR manually, each line:
docker build -t myimage .
docker run --name api_doc myimage
docker cp api_doc:/myapp/build/index.html ./build/
docker stop api_doc
docker rm api_doc
```

## Deploy

Deployment -- via Wordpess
--------------------------
### Prerequisites
Need to add public key to https://unified.cloudways.com/server/1288624/access_detail

### Copy file to wordpress
```shell
scp  build/index.html master_znpugbhzny@140.82.47.184:applications/practitest/public_html/api-v2/
```
Wait few hours, for cache


Old with Jekyll website:
-------------------------
aws s3 cp build/index.html  s3://pt_public/api/slate-apiv2/index.html --acl public-read
aws cloudfront create-invalidation --distribution-id E2V3PVGRJTV0N8 \
  --paths /api/slate-apiv2/index.html
