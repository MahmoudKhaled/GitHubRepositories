//
//  README.md
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/13/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

## Building and running the project (requirements).
* Swift 5.0
* Xcode 11.3.1+
* iOS 12.0+

## Setup Configs
- Checkout master branch to run latest version
- Open the terminal.
- Navigate to the project root directory.
- Open the project by double clicking the `GitHubRepositories.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app

## Architecture
This application uses the Model-View-ViewModel (refered to as MVVM) architecture,
the main purpose of the MVVM is to move the data state from the View to the ViewModel.

## Scenes:
* Group of app scenes: Repositories and RepositoryDetails 

## About:
- The goal of this task is to get all  public GitHub repositories, with search feature and navigate to reposiotry details
- Repositories paginated 10 items each time, depending on localData.
- (Network part, Load images)  implemented natively using Swift.

