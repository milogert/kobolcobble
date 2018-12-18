module Model.Critical exposing (Critical, alchemy, antagonize, bash, bigBash, bite, blind, block, changingTides, concussion, confidence, confuse, curse, dodge, eggToss, evade, fog, frenzy, furious, grab, grounded, hardHead, heal, kneecap, muskyScent, myNameIs, nastySprain, pickpocket, poison, poisonCloud, shove, strangeAllure, stunned, swing, teleport, terrify, windsOfFate)


type alias Critical =
    { title : String
    , description : String
    }



-- Barry the Elf.


myNameIs : Critical
myNameIs =
    Critical "My Name Is..." ""



-- Egg Keeper.


antagonize : Critical
antagonize =
    Critical "Antagonize" ""


eggToss : Critical
eggToss =
    Critical "Egg Toss" ""


muskyScent : Critical
muskyScent =
    Critical "Musky Scent" ""


strangeAllure : Critical
strangeAllure =
    Critical "Strange Allure" ""


alchemy : Critical
alchemy =
    Critical "Alchemy" ""


bash : Critical
bash =
    Critical "Bash" ""


bigBash : Critical
bigBash =
    Critical "Big Bash" ""


bite : Critical
bite =
    Critical "Bite" ""


blind : Critical
blind =
    Critical "Blind" ""


block : Critical
block =
    Critical "Block" ""


changingTides : Critical
changingTides =
    Critical "Changing Tides" "Avtive player may shuffle their discard pile back into their Combat Deck."


concussion : Critical
concussion =
    Critical "Concussion" ""


confidence : Critical
confidence =
    Critical "Confidence" ""


confuse : Critical
confuse =
    Critical "Confuse" ""


curse : Critical
curse =
    Critical "Curse" ""


dodge : Critical
dodge =
    Critical "Dodge" ""


evade : Critical
evade =
    Critical "Evade" ""


fog : Critical
fog =
    Critical "Fog" ""


frenzy : Critical
frenzy =
    Critical "Frenzy" ""


furious : Critical
furious =
    Critical "Furious" ""


grab : Critical
grab =
    Critical "Grab" ""


grounded : Critical
grounded =
    Critical "Grounded" ""


hardHead : Critical
hardHead =
    Critical "Hard Head" ""


heal : Critical
heal =
    Critical "Heal" ""


kneecap : Critical
kneecap =
    Critical "Kneecap" ""


nastySprain : Critical
nastySprain =
    Critical "Nasty Sprain" ""


pickpocket : Critical
pickpocket =
    Critical "Pickpocket" ""


poison : Critical
poison =
    Critical "Poison" ""


poisonCloud : Critical
poisonCloud =
    Critical "Poison Cloud" ""


shove : Critical
shove =
    Critical "Shove" ""


stunned : Critical
stunned =
    Critical "Stunned" ""


swing : Critical
swing =
    Critical "Swing" ""


teleport : Critical
teleport =
    Critical "Teleport" ""


terrify : Critical
terrify =
    Critical "Terrify" ""


windsOfFate : Critical
windsOfFate =
    Critical "Winds of Fate" ""
