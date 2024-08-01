## News App

News App serves news feed from newsapi.org.
It is my pet project to showcase my coding capabilities. 


## Try it out today!

I recommend trying this project in IDX since it handles all dependencies for
you. You are able to launch this project in IDX and get going testing with
only slight configuration required.


<a href="https://idx.google.com/import?url=https%3A%2F%2Fgithub.com%2Fjayjayesh%2Fnews_app.git">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.idx.dev/btn/try_light_32.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://cdn.idx.dev/btn/try_dark_32.svg">
    <img height="32" alt="Try in IDX" src="https://cdn.idx.dev/btn/try_purple_32.svg">
  </picture>
</a>


## Implemented Features

-- clean architecture to achive : modular code, scalability, code testability 

-- news api integration : top headline

-- pagination

-- pull-to-refresh to fetch recent news posts

-- filter : news source

-- reset filter : tap on navigation_bar title to show all news top headline

-- internet-connectivity

-- pigeon : host api integration

-- native news details screen : iOS (done) , android (todo)

-- security : app_config.json : will not upload sensitive data to github

-- unit test : implemented test for all api integrated in this app

-- cicd : github action for Android apk & codemagic for ios ipa


https://github.com/jayjayesh/news_app/assets/10362928/adb4684e-c239-4bb7-9521-247531120e2e


## Getting Started

`Used Flutter Version`

Flutter 3.22.1 • channel stable

Tools • Dart 3.1.0 • DevTools 2.25.0

`To run this project`

(1) create `app_config.json` file at (assets/app_config/app_config.json)

(2) copy content from file `app_config.json.temp` past that into `app_config.json` 

(3) create your own api_key at : [newsapi.org](https://newsapi.org) and replace base_url and news_api_key in `app_config.json` 

(4) terminal : flutter pub get

(5) terminal : flutter pub run


## Open-Source Contribution
For those who wish to contribute in this project, Please follow git commit message rule : [How to Write Better Git Commit Messages](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages)


## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).


## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
