#  Game Logic Prototype

On button Press update the following functions:

onButtonPress(action)
    updatePitchCount(action)     // steal, strike, foul, ball, hit
    drawFunction()


Pitch count Balls/Strikes/Outs/Fouls/Hit

updatePitchCount(action)

    if action == ‘ball’
        ball +1

    elif action == ‘strike’
        strike +1

    elif action == ‘foul’
        if strike > 2
            strike + 1
        else
            pass

    elif action == ‘hit’
        playerOnBase(action)     // baseStatus
        ball = 0
        strike = 0

    If balls = 4
        playerOnBase(action)
        updatePitcher(action) // Update stats of pitcher

    If Strikes = 3
        updateOuts(action)
        batter = roster + 1
        updatePitcher(action)

    If outs = 3     // New inning, change batter/pitcher
        updateInnings(Inning)

# Update Players On base

playerOnBase(action)

    If action == ‘walk’
        updateBatter(action)

    If action == ‘hit’
        updateBatter(action)

    If player = homeBase
        updateScore()


updateInnings(Inning)


    if Inning % 2 == 0
        change to Top and inning + 1
        changeSides(Bottom)
    else
        change to Bottom and Inning + 1
        changeSides(Top)

    
changeSides(Inning)

    switchPitcher(Inning)
    switchBattingRoster(Inning)

updateBatter(action, distance)
    
    updateOnBasePlayers(action)
    atBat = atBat[ + 1]
    
updateOnBasePlayers(action) // Add in baserunner distance moved
    
    // Linked List possibly
    
    if action == 'single'
        firstBase == atBat
    elif action == 'double'
        secondBase == atBat
    elif action == 'triple'
        thirdBase == atBat
    elif action == 'walk'
        firstBase == atBat
        

updateScore(Inning)

    if Inning % 2 == 0
        homeScore +1
    else
        awayScore +1
        
updateOuts(action)

    outs +1
    
switchPitcher(Inning)

    if Inning % 2 == 0
        pitcher = homePitcher
    else
        pitcher = awayPitcher
        
switchBattingRoster(Inning)

    if Inning % 2 == 0
        roster = homeRoster
    else
        roster = awayRoster
    


Update Batter Stats
Update Pitcher Stats

