#  Concentration Game

## Working Parts
The following are the things that are the working parts so far in the concentration game.
1. There is 3 different games that are working (Shapes, Emojis, Temples)
2. Each one of the games has different animations when two cards are face up and matched
3. There is two animations to show that there is bonus time: Pie Animation, Horizontal Bar Animation. The emojis game uses the pie animation, and the 
othe two uses the horizontal animation.
4. There is at six themes for the Temples and Emojis games, and five themes for the shapes match game
5. A theme can be added with only one line. These can be seen in the file MenuGamesViewModel. For example: 
    * `let centralAmericaTemplesTheme = ThemeViewModel(name: "Central America Temples", color: "ffa500", emojis: centralAmericaTemples)`
6. The shape themes are related to circles, triangles, starts, rectangles, and they are generated randomly to be filled or not with a random color.
7. There is extra view modifiers: For example, there is a view modifier to have a striped rbackground view to show each one of the different themes in the shape game.
8. The views for each one of the themes for each game have a different view. The color of the cards change according to the theme color.
9. There is an image background in the menu view to select the game, and also there is background images in each one of the menus of the individual games menus.
10. The numbers of columns when the games are started are scaled according to the number of cards
11. There is a speaker icon at the top of each game to turn off the sound effects. The icon changes as well to notify there is no sound
12. There is use of pickers to select the numbers of pairs of cards and game theme when the user is in a game menu for any of the three types of games.
13. There is an obvious  end of game when the game is finished, and also there is the option to start a new game.
14. The highest scores of each game are stored using UserDefaults.
15. There is a view for each one of the scores for each theme, so the highest scores can be seen for theme.

## Need Repair
1. The button to start a game does not work at teh beginning of a game. It only works when the game has ended.
2. The algorithm to define the number of columns when a new game starts is not the best.
