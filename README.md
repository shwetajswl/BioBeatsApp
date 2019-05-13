# BioBeats App Mobile Application for iOS

## Getting Started

Open the terminal and run the command  `sudo gem install cocoapods` to:

- Install Cocoapods

Whenever you checkout a new branch perform the following to ensure your submodule is pointed at the correct revision of the *JLRICRCommon-Redev* repository for that branch.


## Environment

Language: **Swift**

Xcode: **10.2**

Unit and UI Tests: **XCTest**

Asset Management: **Asset catalogues**

iOS Version: **iOS 11+**

Reasoning: We always recommend supporting the current version and the previous one. From [Apple's stats](https://developer.apple.com/support/app-store/) this should cover 95% of their users. However please let me know if your own analytics disagrees with apple's stats so we can plan accordingly.


## Architecture

Inspired by: [**Modern MVC**](https://www.raywenderlich.com/132662/mvc-in-ios-a-modern-approach)

Reasoning: This approach tries to use a modern and testable approach but still keeping within apple's way of doing things and doesn't create any potentially brittle third party dependencies. 


## Dependency Management

### Cocoapods

As a developer, we will wrap all third party dependencies so they will be easy to switch out if needed.

#### [AlamoFire](https://github.com/Alamofire/Alamofire) - Network requests
License: **MIT**


## Templates

I have created a template so when you add a new feature, it will automatically create the groundwork for all the classes needed. It will create:

- **NAME**ViewController.swift
- **NAME**Cell
- **NAME**Model

Where **NAME** is the name given when creating the classes.


## Design

I have used Main.storyboard file to create UI screens.
# BioBeatsApp
