# Implemented Features

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


## ToDo

-- github action : add build artifacts in realease path where code snapshot is present

-- github action : fix iOS build creating IPA

-- github action : add auto increament build number and also rename build-name with that version number

-- github action : upload build to firebase distibution

-- github action : update github secrets to deploy new-api key so that created build make apk works on any device

-- codemagic : iOS build setup

-- fastlane setup 



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
