# Jahez Movies
# SwiftUI + MVVM + Combine + Modern Concurrency

## 🎥 Demo Video
https://github.com/user-attachments/assets/a6ae19bb-1246-426b-8530-a3b3ccd0f63c

## High-level Design
<img width="756" height="725" alt="Image" src="https://github.com/user-attachments/assets/a6ae19bb-1246-426b-8530-a3b3ccd0f63c" />

## Requirements:
### Functional:
- Fetching and parsing data from API.
- Listing Data.
- Searching.
- Search suggestions.
- Navigation to Details view.

### Non-Functional:
- Performance:
  - Caching images.

- Scalability:
  - Modularity.
  
- Reliability:
  - Unit tests.

## Design Decisions
- UI:
  - SwiftUI
  - MVVM Clean Code Architecture

- Principals and Patterns:
  - SOLID conformance:
    - Features are separated into modules.
    - UseCases for business logic.
  - Coordinator & Router pattern for navigation.

## App Structure

- App
    
- Network Package
  
- Modules -- Movies -- MovieDetails
    
- UseCases
  
- Services

- Repositories
  
- Resources

- Dependency Manager:
  - Swift Package Manager

- Dependencies:
  - [Kingfisher](https://github.com/onevcat/Kingfisher): Downloading and caching images from the web.
  - [Networking](https://github.com/MhMudSalAh/Networking): Downloading and caching images from the web.


### Author
Created by Mahmoud Salah on 2026. Copyright © 2026 Mahmoud Salah [LinkedIn](https://www.linkedin.com/in/mahmoud-salah-a40465149/).<br/>
Please don't hesitate to ask any clarifying questions about the project if you have any.
