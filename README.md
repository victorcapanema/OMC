# Open Magic Counter
A life counter for Magic the Gathering

![app](https://i.ibb.co/zmYZ6yh/Screenshot-20230831-140141.png)


## Getting Started
This project is a open source life counter for Magic the Gathering, for now we can:
- Track life
- See the historic of life changes
- Track commander damage (for now only 1 cmd for each player)
- Track some counters (poison, energy, exp, cmd tax)
- Select 1 to 6 players
- Set cards arts or colors for background
- Get random numbers (dices)
- Mana and storm counters
- Save players profile with selected cards and colors
- Consult the Gatherer
- Change aspects of layout (font size, color, contrast)

  ### About the Functions
    - To change the starting life points just choose a value and press reset
    - The numbers of players is changed without reset the actual state
    - The fuctions that use ScryFall API have a cooldown to avoid people of abusing and get banned
    - There is no limit of profiles that can be saved
    - To load a profile, just select a background to load with and press load
    - And the rest is pretty self-explanatory

## About the Architecture
This is a Flutter app that was built using an adapted MVC architecture to keep it simple.
For this, are utilized some packages, this 2 are the most important:
- Modular (navigation and dependency injection)
- MobX (state management)

And we have others like:
- Dio (HTTP networking)
- Dartz (error treatment)
- Shared Preferences(save profiles)

This chart demonstrate what it is suposed to be:  
|![chart.png](https://i.ibb.co/zZ8NjgF/chart.png)|
|:--:|
|*Architecture Representation*|

## Want to Contribute?
1. Clone repo and create a new branch
2. Make changes and test
3. Submit Pull Request with comprehensive description of changes

## Contribuitors
- [Victor Capanema](https://www.linkedin.com/in/victor-carvalho-capanema-437387126/) (Base project)