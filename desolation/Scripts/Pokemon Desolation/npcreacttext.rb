$NPCReactions ={
    :VILLAGECHIEF =>{
        "CURB_STOMP"=>[
            "And... I barely scathed your Pokemon?"
        ],
        "CLOSE_CALL" =>[
            "Tch... you barely defeated me, damn it!"
        ],
        "6-0" =>[
            "And... I couldn't even scathe your Pokemon?"
        ]
    },
    :SHIVKENEPH =>{
        "CURB_STOMP"=>[
            "\\ff[02a]I barely stood a chance."
        ],
        "CLOSE_CALL" =>[
            "\\ff[02a]Even though you barely won, you're still certainly something."
        ],
        "6-0" =>[
            "\\ff[02a]I barely stood a chance."
        ]
    },
    :CONNORREDCLIFF =>{
        "CURB_STOMP"=>[
            "\\ff[04a]My... my Pokemon barely stood a chance..."
        ],
        "CLOSE_CALL" =>[
            "\\ff[04a]I... I almost won, but..."
        ],
        "6-0" =>[
            "\\ff[04a]My... my Pokemon didn't even make a dent...",
            "#CODE $game_switches[803]=true"
        ]
    },
    :HARDYROUTE1 =>{
        "MVP" =>[
            "\\ff[06]And that \#{mvp_1} of yours is no pushover either."
        ]
    },
    :SCARLETTROUTE2 =>{
        "CURB_STOMP"=>[
            "\\ff[08c]My Pokemon really struggled against your team, huh?",
            "#CODE if $game_variables[Variables[:BattleDataArray]].last().playerItemsUsed==0",
            "#CODE Kernel.pbMessage(\"\\\\ff[08c]Not to mention that you didn't even need to use any items...\")",
            "#CODE end"
        ],
        "CLOSE_CALL" =>[
            "\\ff[08c]My Pokemon did pretty well against you, but I've still got a ways to go..."
        ],
        "6-0" =>[
            "\\ff[08c]My Pokemon couldn't hold up at all, huh?",
            "#CODE if $game_variables[Variables[:BattleDataArray]].last().playerItemsUsed==0",
            "#CODE Kernel.pbMessage(\"\\\\ff[08c]Not to mention that you didn't even need to use any items...\")",
            "#CODE end"
        ]
    },
    :ADERYNCELESTE =>{
        "CURB_STOMP"=>[
            "\\ff[01]Yet, you're far tougher than I expected."
        ],
        "CLOSE_CALL" =>[
            "\\ff[01]Despite my best efforts, you prevailed."
        ],
        "6-0" =>[
            "\\ff[01]Yet, I didn't expect to not stand a chance at all.",
            "\\ff[01]Most impressive.",
            "#CODE $game_switches[804]=true"
        ]
    },
    :HARDYROUTE3 =>{
        "SAME_TEAM_SAME_MVP"=>[
            "\\ff[06]Not to mention that \#{mvp_1} of yours is just as strong as before..."
        ],
        "NEW_TEAM_NEW_MVP"=>[
            "\\ff[06]Not to mention that strong new addition to your team...  \#{mvp_1}."
        ],
        "NEW_TEAM_DIFFERENT_MVP"=>[
            "\\ff[06]Not to mention your \#{mvp_1}... I didn't expect that to give me so much grief."
        ],
        "NEW_TEAM_SAME_MVP"=>[
            "\\ff[06]Not to mention that \#{mvp_1} of yours is just as strong as before..."
        ],
        "SAME_TEAM_DIFFERENT_MVP"=>[
            "\\ff[06]Not to mention your \#{mvp_1}... I didn't expect that to give me so much grief."
        ],
        "SAME_TEAM_NEW_MVP"=>[
            "\\ff[06]Not to mention that strong new addition to your team...  \#{mvp_1}."
        ]
    },    
    :AMELIAADDENFALL =>{
        "CURB_STOMP"=>[
            "\\ff[15]I barely stood a chance."
        ],
        "CLOSE_CALL" =>[
            "\\ff[15]Although it was close... you somehow bested me."
        ],
        "6-0" =>[
            "\\ff[15]I got absolutely obliterated."
        ]
    },
    :TRISTANROUTE4 =>{
        "MVP" =>[
            "\\ff[14]I really was no match for your \#{mvp_1}."
        ]
    },
    :EMILY =>{
        "CURB_STOMP"=>[
            "\\ff[13]You know, I didn't expect you to drain my batteries that easily."
        ],
        "CLOSE_CALL" =>[
            "\\ff[13]It was close, but my batteries didn't quite get me through."
        ],
        "6-0" =>[
            "\\ff[13]You know, I couldn't even manage a spark against you.",
            "\\ff[13]I hope you realize how impressive that truly is.",
            "#CODE $game_switches[806]=true"
        ]
    },
    :NOVAMANOR =>{
        "CURB_STOMP"=>[
            "\\ff[11]I really didn't stand a chance against you."
        ],
        "CLOSE_CALL" =>[
            "\\ff[11]It was closer than I envisioned, but you are still the victor."
        ],
        "6-0" =>[
            "\\ff[11]I mean, my Pokemon didn't even make the slightest dent in your team."
        ]
    },
    :AMELIADEN =>{
        "SAME_TEAM_SAME_MVP"=>[
            "\\ff[15]I can mostly put the blame on that \#{mvp_1} of yours again, damn it."
        ],
        "NEW_TEAM_NEW_MVP"=>[
            "\\ff[15]I can mostly put the blame on that new addition of yours, \#{mvp_1}, damn it."
        ],
        "NEW_TEAM_DIFFERENT_MVP"=>[
            "\\ff[15]I can mostly put the blame on that \#{mvp_1} of yours, damn it."
        ],
        "NEW_TEAM_SAME_MVP"=>[
            "\\ff[15]I can mostly put the blame on that \#{mvp_1} of yours again, damn it."
        ],
        "SAME_TEAM_DIFFERENT_MVP"=>[
            "\\ff[15]I can mostly put the blame on that \#{mvp_1} of yours, damn it."
        ],
        "SAME_TEAM_NEW_MVP"=>[
            "\\ff[15]I can mostly put the blame on that new addition of yours, \#{mvp_1}, damn it."
        ]
    },  
    :ROSETTA =>{
        "CURB_STOMP"=>[
            "\\ff[07a]For you to come out here and defeat me so easily..."
        ],
        "CLOSE_CALL" =>[
            "\\ff[07a]It was close, but you managed to best me, even in front of all of these people..."
        ],
        "6-0" =>[
            "\\ff[07a]For you to come out here and defeat me without losing a single Pokemon...",
            "\\ff[07a]That is extremely impressive.",
            "#CODE $game_switches[807]=true"
        ]
    },
    :CONNORTOURNEY =>{
        "SPAMMED_UNSPECIFIED_MOVE"=>[
            "\\ff[04a]Although, please... let's be honest, you just used \#{move} over and over again."
        ]
    },
    :SCARLETTTOURNEY =>{
        "CURB_STOMP"=>[
            "\\ff[08a]My Pokemon didn't stand a chance against you, huh?",
            "#CODE if $game_variables[Variables[:BattleDataArray]].last().playerItemsUsed==0",
            "#CODE Kernel.pbMessage(\"\\\\ff[08a]Not to mention that you won without using any items...\")",
            "#CODE end"
        ],
        "CLOSE_CALL" =>[
            "\\ff[08a]My Pokemon fought right to the end, but you just managed to win, huh?"
        ],
        "6-0" =>[
            "\\ff[08a]I mean, we couldn't even defeat one of your Pokemon...",
            "#CODE if $game_variables[Variables[:BattleDataArray]].last().playerItemsUsed==0",
            "#CODE Kernel.pbMessage(\"\\\\ff[08a]Not to mention that you won without using any items...\")",
            "#CODE end"
        ]
    },
    :HARDYDEN =>{
        "CURB_STOMP"=>[
            "\\ff[06M]My Pokemon barely managed to phase you."
        ],
        "CLOSE_CALL" =>[
            "\\ff[06M]Although it was close, defeat is defeat."
        ],
        "6-0" =>[
            "\\ff[06M]How pitiful... I couldn't even beat one of your Pokemon."
        ]
    },
    :SENAGUILD =>{
        "MVP" =>[
            "\\ff[16]And that \#{mvp_1} of yours... well, I couldn't do a thing to stop it."
        ]
    },
    :AARON =>{
        "CURB_STOMP"=>[
            "\\ff[22]For you to defeat me so easily, and on my own field to boot..."
        ],
        "CLOSE_CALL" =>[
            "\\ff[22]Hmph... although my own field made it close, you have still bested me."
        ],
        "6-0" =>[
            "\\ff[22]For you to defeat me on my own field without losing a single Pokemon...",
            "\\ff[22]I simply don't know what to say.",
            "#CODE $game_switches[809]=true"
        ]
    },
    :GARRETCELLIA =>{
        "CURB_STOMP"=>[
            "\\ff[18b]For you to beat me so easily in front of a crowd like that?",
            "\\ff[18b]Ugh..."
        ],
        "CLOSE_CALL" =>[
            "\\ff[18b]It was a close one, mate... but at least we gave the crowd what they wanted."
        ],
        "6-0" =>[
            "\\ff[18b]For you to beat me so easily in front of a crowd like that, without even losing a single Pokemon?",
            "\\ff[18b]Damn... shit's embarrassing.",
            "#CODE $game_switches[808]=true"
        ]
    },
    :CEDRICCELLIA =>{
        "MVP" =>[
            "\\ff[23]You and your \#{mvp_1} make a good team."
        ]
    },
    :ADERYNRUBYISLAND =>{
        "MVP" =>[
            "\\ff[01]Of course, your \#{mvp_1} was particularly impressive."
        ]
    },
    :BARONCELLIA =>{
        "CURB_STOMP"=>[
            "\\ff[10c]Considering the ease with which you won, I don't even know why I bothered."
        ],
        "CLOSE_CALL" =>[
            "\\ff[10c]Hmph... despite how close it was, I still couldn't stop you."
        ],
        "6-0" =>[
            "\\ff[10c]To think that I couldn't even defeat one of your Pokemon... hmph..."
        ]
    },
    :WALDENHALLVISINITE =>{
        "CURB_STOMP"=>[
            "\\ff[26]To beat my Pokemon with such ease? Hmph..."
        ],
        "CLOSE_CALL" =>[
            "\\ff[26]Although it was close, you still beat me..."
        ],
        "6-0" =>[
            "\\ff[26]To beat me without losing a single Pokemon? Hmph..."
        ]
    },
    :CEDRICFAIRBALE =>{
        "SAME_TEAM_SAME_MVP"=>[
            "\\ff[23]As I said before, you and your \#{mvp_1} make an excellent team."
        ],
        "NEW_TEAM_NEW_MVP"=>[
            "\\ff[23]After all, you and your \#{mvp_1} make an excellent team."
        ],
        "NEW_TEAM_DIFFERENT_MVP"=>[
            "\\ff[23]After all, you and your \#{mvp_1} make an excellent team."
        ],
        "NEW_TEAM_SAME_MVP"=>[
            "\\ff[23]As I said before, you and your \#{mvp_1} make an excellent team."
        ],
        "SAME_TEAM_DIFFERENT_MVP"=>[
            "\\ff[23]After all, you and your \#{mvp_1} make an excellent team."
        ],
        "SAME_TEAM_NEW_MVP"=>[
            "\\ff[23]After all, you and your \#{mvp_1} make an excellent team."
        ]
    }, 
    :REEVE =>{
        "CURB_STOMP"=>[
            "\\ff[25]To outdance me so easily in front of a crowd like this?"
        ],
        "CLOSE_CALL" =>[
            "\\ff[25]It was a narrow affair, but it would seem that your dance shines brighter than mine."
        ],
        "6-0" =>[
            "\\ff[25]The dance you shared with your Pokemon was so fluid that I couldn't even defeat one of them.",
            "\\ff[25]I... I don't know what to say.",
            "#CODE $game_switches[810]=true"
        ]
    }
}