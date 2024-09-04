# MoonzPlay

MoonzPlay is a simple iOS application that fetches and displays details of a TV show, its seasons, and episodes. This app uses [themoviedb.org](https://www.themoviedb.org/) APIs to retrieve data and integrates Swift packages like Alamofire, SDWebImage, and MPNetworkPackage for network and image handling.

## Features

- Fetch TV show details
- Display season details for a particular TV show
- View a list of episodes for each season
- Caching and image handling using SDWebImage
- Networking handled by Alamofire and MPNetworkPackage
- Download video to your gallery (right now from default URL)

## Tech Stack

- **Language**: Swift
- **API**: [themoviedb.org](https://www.themoviedb.org/) 
- **Packages Used**:
  - [Alamofire](https://github.com/Alamofire/Alamofire): For handling network requests.
  - [SDWebImage](https://github.com/SDWebImage/SDWebImage): For asynchronous image loading and caching.
  - [MPNetworkPackage](https://github.com/Noshaid/MPNetworkPackage): For Rest API calls

## Installation

Clone the repository:
   ```bash
   git clone https://github.com/yourusername/MoonzPlay.git
   ```

## Project Structure

- MoonzPlay/: Main app source code.
- MoonzPlayUITests/: UI testing code.
- MoonzPlayTests/: Unit testing code.
- MPNetworkPackage/: Contains the network handling code using Alamofire.

## Usage
```bash
cd MoonzPlay
```

- Install dependencies: Open the `MoonzPlay.xcodeproj` in Xcode and let it resolve package dependencies.
- Run project

![Simulator Screenshot - iPhone 15 Pro - 2024-09-04 at 18 22 11](https://github.com/user-attachments/assets/8b9b3eb8-dbdc-4967-ab94-bc25583690cb)
