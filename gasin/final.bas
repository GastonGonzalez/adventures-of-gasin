DECLARE SUB CheckTileDown ()
DECLARE SUB CheckTileRight ()
DECLARE SUB CheckTileLeft ()
DECLARE SUB CheckTileUp ()
DECLARE SUB loadgraphics ()
DECLARE SUB Drawscreen ()
DECLARE SUB LoadMap ()
DECLARE SUB Attack ()
DECLARE SUB Menu ()
DECLARE SUB Loadgame ()
DECLARE SUB Savegame ()
DECLARE SUB clearing ()
DECLARE SUB attackgraphics ()
DECLARE SUB Gameover ()
DECLARE SUB Talk ()
DECLARE SUB Display ()
DECLARE SUB Health ()
DECLARE SUB Potion ()
DECLARE SUB Drawbox ()
DECLARE SUB Inventory ()
DECLARE SUB Pu ()
DECLARE SUB Pd ()
DECLARE SUB Pl ()
DECLARE SUB Pr ()
DECLARE SUB Magic ()
DECLARE SUB selectplayers ()
DECLARE SUB saver ()
DECLARE SUB fireattack ()
DECLARE SUB buyweapons ()
DECLARE SUB pay ()
DECLARE SUB bossattack ()
DECLARE SUB bossattackgraphics ()
DECLARE SUB win ()
DECLARE SUB showlife ()

COMMON SHARED amagic, weapon, sword, knife, axe, fire, ice, harm, playerselect, ppx, ppy, pmx, pmy, mapx, mapy, map$, tileup, tiledown, tileright, tileleft, gold, life, HP, experience, serf, potions
SCREEN 13

DIM SHARED clerk2(60), boss1(60), boss2(60), stairs(60), wmageleft(60), wmageleftmask(60), wmageright(60), wmagerightmask(60), wmageup(60), wmageupmask(60), wmagedown(60), wmagedownmask(60), playerupmask(60), playerdownmask(60), playerleftmask(60), playerrightmask(60), playerup(60), playerdown(60), playerright(60), playerleft(60), blank(60), grass(60), wall(60), water(60), tree(60), stones(60), tiles(60), windows(60), door(60), bridge(60), castle(60), fountain(60), clerk(60)

ppx = 150
ppy = 85
pmx = 11
pmy = 16
map$ = "c:\Gasin\MAP.MAP"
Load = 1
life = 100
gold = 500
HP = 0
experience = 10
potions = 0
Menu

loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy


REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pu

MovementCode:

x = INT(RND * 8) + 1
IF x = 2 AND Load = 2 THEN LOCATE 2, 1: COLOR 4: Attack

Display

IF pmx = 15 AND pmy = 13 AND Load = 1 THEN
map$ = "c:\Gasin\MAP2.MAP"
Load = 2
pmx = 6
pmy = 13
loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pr

END IF

IF pmx = 5 AND pmy = 13 AND Load = 2 THEN
map$ = "c:\Gasin\MAP.MAP"
Load = 1
pmx = 14
pmy = 13
Load = 1
loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pl

END IF

IF pmx = 12 AND pmy = 6 AND Load = 1 THEN
map$ = "c:\Gasin\MAP3.MAP"
Load = 3
pmx = 10
pmy = 15
loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pu

END IF


IF pmx = 10 AND pmy = 16 AND Load = 3 THEN
map$ = "c:\Gasin\MAP.MAP"
Load = 1
pmx = 12
pmy = 7

loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pd

END IF

IF pmx = 6 AND pmy = 8 AND Load = 3 THEN
map$ = "c:\Gasin\MAP4.MAP"
Load = 4
pmx = 13
pmy = 8
loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pl

END IF


IF pmx = 14 AND pmy = 8 AND Load = 4 THEN
map$ = "c:\Gasin\MAP3.MAP"
Load = 3
pmx = 7
pmy = 8
loadgraphics

OPEN map$ FOR INPUT AS #1
INPUT #1, mapx, mapy

REDIM SHARED map(mapx, mapy)

LoadMap
Drawscreen
Pr

END IF

IF pmx = 7 AND pmy = 12 AND Load = 3 THEN Talk
IF pmx = 8 AND pmy = 10 AND Load = 4 THEN bossattack

WHILE GASTON$ <> CHR$(27)
GASTON$ = INKEY$
SELECT CASE GASTON$


CASE CHR$(0) + "H"
pmy = pmy - 1
CheckTileUp
LOCATE 2, 1: PRINT "              "
Pu
GOTO MovementCode

CASE CHR$(0) + "P"
pmy = pmy + 1
CheckTileDown
LOCATE 2, 1: PRINT "              "
Pd
GOTO MovementCode

CASE CHR$(0) + "M"
pmx = pmx + 1
CheckTileRight
LOCATE 2, 1: PRINT "              "
Pr
GOTO MovementCode

CASE CHR$(0) + "K"
pmx = pmx - 1
CheckTileLeft
LOCATE 2, 1: PRINT "              "
Pl
GOTO MovementCode

END SELECT
WEND

Gameover

SUB Attack
 
attackgraphics

Chooseguy = INT(RND * 3) + 1

IF Chooseguy = 1 THEN
LOCATE 16, 5: COLOR 23: PRINT "I have been sent "
LOCATE 17, 5: COLOR 24: PRINT "by King Duncan to"
LOCATE 18, 5: COLOR 25: PRINT "Kill you."
END IF

IF Chooseguy = 2 THEN
LOCATE 16, 5: COLOR 23: PRINT "Thee shall not "
LOCATE 17, 5: COLOR 24: PRINT "pass, pay 5 gold or"
LOCATE 18, 5: COLOR 25: PRINT "suffer my wrath."
END IF

IF Chooseguy = 3 THEN
LOCATE 16, 5: COLOR 23: PRINT "I am Thane of Kiln "
LOCATE 17, 5: COLOR 24: PRINT "and you are not"
LOCATE 18, 5: COLOR 25: PRINT "welcome here."
END IF


IF experience >= 10 THEN serf = 15
IF experience >= 15 THEN serf = 25
IF experience >= 30 THEN serf = 30
IF experience >= 70 THEN serf = 50

beginning:

x = 210: y = 110
LINE (6 + x, 6 + y)-(84 + x, 65 + y), 0, BF

LOCATE 2, 26: COLOR 23: PRINT "Life "; life
LOCATE 3, 26: COLOR 24: PRINT "Gold "; gold
LOCATE 4, 26: COLOR 25: PRINT "Hp   "; HP
LOCATE 5, 26: COLOR 26: PRINT "Exp  "; experience
LOCATE 7, 26: COLOR 27: PRINT "Potion"; potions
LOCATE 9, 26: COLOR 28: PRINT "Enemy "; serf

COLOR 23: LOCATE 16, 29: PRINT "(F)IGHT"
COLOR 24: LOCATE 17, 29: PRINT "(P)ay"
COLOR 25: LOCATE 18, 29: PRINT "(R)UN"

DO
IF gold = 0 THEN LET gold = 0
GASTON$ = INKEY$
IF gold <= 0 THEN LET gold = 0: LOCATE 3, 31: PRINT gold
IF GASTON$ = CHR$(102) THEN GOTO Fight
IF GASTON$ = CHR$(114) THEN GOTO Runs
IF GASTON$ = CHR$(112) THEN pay
LOOP

Fight:

COLOR 7

LOCATE 16, 28: COLOR 23: PRINT "(A)ttack"
LOCATE 17, 28: COLOR 24: PRINT "(M)agic"
LOCATE 18, 28: COLOR 25: PRINT "(P)otion"

DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(97) THEN GOTO Attack
IF GASTON$ = CHR$(109) THEN GOTO Magic
IF GASTON$ = CHR$(112) THEN GOTO Potion
LOOP

Attack:

x = 210
y = 110
LINE (6 + x, 6 + y)-(84 + x, 65 + y), 0, BF

LOCATE 16, 28: COLOR 23: PRINT "(P)unch"
LOCATE 17, 28: COLOR 24: PRINT "(S)word"; sword
LOCATE 18, 28: COLOR 25: PRINT "(K)nife"; knife
LOCATE 19, 28: COLOR 26: PRINT "(A)xe  "; axe
SLEEP

DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(112) THEN GOTO punchattack
IF GASTON$ = CHR$(115) AND sword >= 1 THEN GOTO swordattack
IF GASTON$ = CHR$(107) AND knife >= 1 THEN GOTO knifeattack
IF GASTON$ = CHR$(97) AND axe >= 1 THEN GOTO axeattack
LOOP

punchattack:
rndexp = INT(RND * 4) + 1
badcarry = INT(RND * 6) + 1

IF experience >= 10 THEN
badattack = INT(RND * 15) + 1
goodattack = INT(RND * 2) + 1
END IF

IF experience >= 15 THEN
goodattack = INT(RND * 4) + 1
badattack = INT(RND * 10) + 1
END IF

IF experience >= 30 THEN
goodattack = INT(RND * 6) + 1
badattack = INT(RND * 20) + 1
END IF

IF experience >= 70 THEN
goodattack = INT(RND * 8) + 1
badattack = INT(RND * 20) + 1
END IF

serf = serf - goodattack
life = life - badattack

IF serf < 0 THEN serf = 0
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You punch the serf"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF serf > 0 THEN GOTO beginning

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
END IF

IF badcarry = 1 OR 4 THEN
LOCATE 18, 5: PRINT "You get 5 gold and"
LOCATE 19, 5: PRINT "gain"; rndexp; "experience."

LET gold = gold + 5
experience = experience + rndexp
LOCATE 5, 31: PRINT experience
LOCATE 3, 31: PRINT gold
END IF

IF badcarry = 3 THEN
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
LOCATE 18, 5: PRINT "You take his potion"
LOCATE 19, 5: PRINT "and gain"; rndexp
LOCATE 20, 5: PRINT "experience."

LET potions = potions + 1
LOCATE 7, 32: PRINT potions
END IF

SLEEP

IF life <= 0 THEN
clearing: LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish

swordattack:
rndexp = INT(RND * 4) + 1
badcarry = INT(RND * 6) + 1

IF experience >= 10 THEN
badattack = INT(RND * 15) + 1
goodattack = INT(RND * 8) + 1
END IF

IF experience >= 15 THEN
goodattack = INT(RND * 20) + 1
badattack = INT(RND * 10) + 1
END IF

IF experience >= 30 THEN
goodattack = INT(RND * 20) + 1
badattack = INT(RND * 20) + 1
END IF

IF experience >= 70 THEN
goodattack = INT(RND * 40) + 1
badattack = INT(RND * 20) + 1
END IF

serf = serf - goodattack
life = life - badattack

IF serf < 0 THEN serf = 0
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You attack the serf"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF serf > 0 THEN GOTO beginning

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
END IF

IF badcarry = 1 OR 4 THEN
LOCATE 18, 5: PRINT "You get 5 gold and"
LOCATE 19, 5: PRINT "gain"; rndexp; "experience."

LET gold = gold + 5
experience = experience + rndexp
LOCATE 5, 31: PRINT experience
LOCATE 3, 31: PRINT gold
END IF

IF badcarry = 3 THEN
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
LOCATE 18, 5: PRINT "You take his potion"
LOCATE 19, 5: PRINT "and gain"; rndexp
LOCATE 20, 5: PRINT "experience."

LET potions = potions + 1
LOCATE 7, 32: PRINT potions
END IF

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish

knifeattack:
rndexp = INT(RND * 4) + 1
badcarry = INT(RND * 6) + 1

IF experience >= 10 THEN
badattack = INT(RND * 8) + 1
goodattack = INT(RND * 8) + 1
END IF

IF experience >= 15 THEN
goodattack = INT(RND * 10) + 1
badattack = INT(RND * 10) + 1
END IF

IF experience >= 30 THEN
goodattack = INT(RND * 15) + 1
badattack = INT(RND * 20) + 1
END IF

IF experience >= 70 THEN
goodattack = INT(RND * 25) + 1
badattack = INT(RND * 20) + 1
END IF

serf = serf - goodattack
life = life - badattack

IF serf < 0 THEN serf = 0
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You stab the enemey"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF serf > 0 THEN GOTO beginning

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
END IF

IF badcarry = 1 OR 4 THEN
LOCATE 18, 5: PRINT "You get 10 gold and"
LOCATE 19, 5: PRINT "gain"; rndexp; "experience."

LET gold = gold + 10
experience = experience + rndexp
LOCATE 5, 31: PRINT experience
LOCATE 3, 31: PRINT gold
END IF

IF badcarry = 3 THEN
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
LOCATE 18, 5: PRINT "You take his potion"
LOCATE 19, 5: PRINT "and gain"; rndexp
LOCATE 20, 5: PRINT "experience."

LET potions = potions + 1
LOCATE 7, 32: PRINT potions
END IF

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish

axeattack:
rndexp = INT(RND * 4) + 1
badcarry = INT(RND * 6) + 1

IF experience >= 10 THEN
badattack = INT(RND * 8) + 1
goodattack = INT(RND * 18) + 1
END IF

IF experience >= 15 THEN
goodattack = INT(RND * 25) + 1
badattack = INT(RND * 10) + 1
END IF

IF experience >= 30 THEN
goodattack = INT(RND * 30) + 1
badattack = INT(RND * 20) + 1
END IF

IF experience >= 70 THEN
goodattack = INT(RND * 25) + 1
badattack = INT(RND * 20) + 1
END IF

serf = serf - goodattack
life = life - badattack

IF serf < 0 THEN serf = 0
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You attack the serf"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF serf > 0 THEN GOTO beginning

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
END IF

IF badcarry = 1 OR 4 THEN
LOCATE 18, 5: PRINT "You get 5 gold and"
LOCATE 19, 5: PRINT "gain"; rndexp; "experience."

LET gold = gold + 5
experience = experience + rndexp
LOCATE 5, 31: PRINT experience
LOCATE 3, 31: PRINT gold
END IF

IF badcarry = 3 THEN
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
LOCATE 18, 5: PRINT "You take his potion"
LOCATE 19, 5: PRINT "and gain"; rndexp
LOCATE 20, 5: PRINT "experience."

LET potions = potions + 1
LOCATE 7, 32: PRINT potions
END IF

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish




Magic:

clearing
x = 210
y = 110
LINE (1 + x, 1 + y)-(90 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(89 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(87 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(86 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(85 + x, 66 + y), 23, B
LINE (6 + x, 6 + y)-(84 + x, 65 + y), 0, BF

LOCATE 16, 28: COLOR 23: PRINT "(F)ire"; fire
LOCATE 17, 28: COLOR 24: PRINT "(I)ce "; ice
LOCATE 18, 28: COLOR 25: PRINT "(H)arm"; harm
LOCATE 20, 28: COLOR 25: PRINT "(B)ack"
DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(98) THEN GOTO beginning
IF GASTON$ = CHR$(102) AND fire >= 1 THEN GOTO fireattack
IF GASTON$ = CHR$(105) AND ice >= 1 THEN GOTO iceattack
IF GASTON$ = CHR$(104) AND harm >= 1 THEN GOTO harmattack


LOOP

GOTO beginning

fireattack:
firernd = INT(RND * 3) + 1

IF firernd = 1 OR 2 OR 3 THEN

serf = serf - 20
fire = fire - 1

IF serf < 0 THEN serf = 0

LOCATE 9, 26: COLOR 28: PRINT "Enemy "; serf
LOCATE 16, 5: PRINT "Enemey is on fire"
LOCATE 17, 5: PRINT "and gets 20 damage"
SLEEP

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
SLEEP
GOTO finish
END IF
END IF
GOTO beginning


iceattack:
icernd = INT(RND * 3) + 1

IF icernd = 1 OR 2 OR 3 THEN

serf = serf - 15
ice = ice - 1

IF serf < 0 THEN serf = 0

LOCATE 9, 26: COLOR 28: PRINT "Enemy "; serf
LOCATE 16, 5: PRINT "Enemey is on frozen"
LOCATE 17, 5: PRINT "and gets 15 damage"
SLEEP

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
SLEEP
GOTO finish
END IF
END IF
GOTO beginning

harmattack:
harmrnd = INT(RND * 3) + 1

IF harmrnd = 1 OR 2 OR 3 THEN

serf = serf - 18
harm = harm - 1

IF serf < 0 THEN serf = 0

LOCATE 9, 26: COLOR 28: PRINT "Enemy "; serf
LOCATE 16, 5: PRINT "Enemey is critical"
LOCATE 17, 5: PRINT "and gets 18 damage"
SLEEP

IF serf <= 0 THEN
LOCATE 9, 32: PRINT serf
clearing
LOCATE 16, 5: PRINT "Enemey defeated"
HP = HP + 2
SLEEP
GOTO finish
END IF

END IF
GOTO beginning



Potion:
clearing
IF potions >= 1 THEN
life = 100
potions = potions - 1
LOCATE 2, 31: PRINT life
LOCATE 7, 32: PRINT potions
LOCATE 16, 5: PRINT "You feel stronger"
GOTO beginning
SLEEP
END IF

IF potions <= 0 THEN
LOCATE 16, 5: PRINT "No potions"
GOTO beginning
SLEEP
END IF

Runs:
clearing
running = INT(RND * 3) + 1

IF running = 1 THEN
life = life - 2
LOCATE 16, 5: PRINT "The enemy blocks"
LOCATE 17, 5: PRINT "you and you have"; 2
LOCATE 18, 5: PRINT "damage."
SLEEP
GOTO beginning
END IF

IF running = 2 THEN
LOCATE 16, 5:
PRINT "You get away"
SLEEP
GOTO finish
END IF

IF running = 3 THEN
life = life - 3
LOCATE 16, 5: PRINT "You trip and fall."
LOCATE 17, 5: PRINT "You are attacked"
LOCATE 18, 5: PRINT "and have 3 damage"
SLEEP
GOTO beginning
END IF

GOTO finish

finish:

CLS
Drawscreen
Pd

END SUB

SUB attackgraphics
CLS

x = 20
y = 0
LINE (1 + x, 1)-(145 + x, 101), 23, B
LINE (2 + x, 2)-(144 + x, 100), 24, B
LINE (3 + x, 3)-(143 + x, 99), 25, B
LINE (4 + x, 4)-(142 + x, 98), 24, B
LINE (5 + x, 5)-(141 + x, 97), 23, B

x = 72
y = 30


x = 190
y = 0

LINE (1 + x, 1 + y)-(100 + x, 100 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 99 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 98 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 97 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 96 + y), 23, B

y = 110
x = 20
LINE (1 + x, 1 + y)-(180 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(179 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(178 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(177 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(176 + x, 66 + y), 23, B


x = 210
y = 110
LINE (1 + x, 1 + y)-(90 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(89 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(88 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(87 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(86 + x, 66 + y), 23, B
LINE (6 + x, 6 + y)-(85 + x, 65 + y), 0, BF

PUT (26, 7), tree
PUT (41, 7), tree
PUT (56, 7), tree
PUT (71, 7), tree
PUT (86, 7), tree
PUT (101, 7), tree
PUT (116, 7), tree
PUT (131, 7), tree
PUT (146, 7), tree

PUT (26, 22), tree
PUT (41, 22), tree
PUT (56, 22), tree
PUT (71, 22), tree
PUT (86, 22), tree
PUT (101, 22), tree
PUT (116, 22), tree
PUT (131, 22), tree
PUT (146, 22), tree

PUT (26, 37), tree
PUT (41, 37), grass
PUT (56, 37), grass
PUT (71, 37), grass
PUT (101, 37), grass
PUT (116, 37), grass
PUT (131, 37), grass
PUT (146, 37), tree

PUT (26, 52), grass
PUT (41, 52), grass
PUT (56, 52), tree
PUT (71, 52), grass
PUT (86, 52), grass
PUT (101, 52), grass
PUT (116, 52), grass
PUT (131, 52), grass
PUT (146, 52), grass

PUT (26, 67), grass
PUT (41, 67), grass
PUT (56, 67), grass
PUT (71, 67), grass
PUT (86, 67), grass
PUT (101, 67), grass
PUT (116, 67), grass
PUT (131, 67), grass
PUT (146, 67), tree

PUT (26, 82), grass
PUT (41, 82), grass
PUT (56, 82), grass
PUT (71, 82), grass
PUT (86, 82), tree
PUT (101, 82), grass
PUT (116, 82), grass
PUT (131, 82), grass
PUT (146, 82), grass

PUT (86, 37), clerk2






END SUB

SUB bossattack

bossattackgraphics

bosstalk = INT(RND * 3) + 1

IF bosstalk = 1 THEN
LOCATE 16, 5: COLOR 23: PRINT "Gasin, you are weak"
LOCATE 17, 5: COLOR 24: PRINT "and I will defeat"
LOCATE 18, 5: COLOR 25: PRINT "you."
END IF

IF bosstalk = 2 THEN
LOCATE 16, 5: COLOR 23: PRINT "You will die if you"
LOCATE 17, 5: COLOR 24: PRINT "try to attack me."
END IF

IF bosstalk = 3 THEN
LOCATE 16, 5: COLOR 23: PRINT "I am Drake and I"
LOCATE 17, 5: COLOR 24: PRINT "will kill you."
END IF


IF experience >= 10 THEN bosslife = 240
IF experience >= 100 THEN bosslife = 260
IF experience >= 150 THEN bosslife = 280
IF experience >= 200 THEN bosslife = 300

beginning4:

x = 210: y = 110
LINE (6 + x, 6 + y)-(84 + x, 65 + y), 0, BF

LOCATE 2, 26: COLOR 23: PRINT "Life "; life
LOCATE 3, 26: COLOR 24: PRINT "Gold "; gold
LOCATE 4, 26: COLOR 25: PRINT "Hp   "; HP
LOCATE 5, 26: COLOR 26: PRINT "Exp  "; experience
LOCATE 7, 26: COLOR 27: PRINT "Potion"; potions
LOCATE 9, 26: COLOR 28: PRINT "Drake"; bosslife

COLOR 23: LOCATE 16, 29: PRINT "(F)IGHT"
COLOR 24: LOCATE 17, 29: PRINT "(P)ay"
COLOR 25: LOCATE 18, 29: PRINT "(R)UN"

DO
IF gold = 0 THEN LET gold = 0
GASTON$ = INKEY$
IF gold <= 0 THEN LET gold = 0: LOCATE 3, 31: PRINT gold
IF GASTON$ = CHR$(102) THEN GOTO Fight4
IF GASTON$ = CHR$(114) THEN GOTO Runs4
IF GASTON$ = CHR$(112) THEN pay
LOOP

Fight4:

COLOR 7

LOCATE 16, 28: COLOR 23: PRINT "(A)ttack"
LOCATE 17, 28: COLOR 24: PRINT "(M)agic"
LOCATE 18, 28: COLOR 25: PRINT "(P)otion"

DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(97) THEN GOTO Attack4
IF GASTON$ = CHR$(109) THEN GOTO Magic4
IF GASTON$ = CHR$(112) THEN GOTO Potion4
LOOP

Attack4:

x = 210
y = 110
LINE (6 + x, 6 + y)-(84 + x, 65 + y), 0, BF

LOCATE 16, 28: COLOR 23: PRINT "(P)unch"
LOCATE 17, 28: COLOR 24: PRINT "(S)word"; sword
LOCATE 18, 28: COLOR 25: PRINT "(K)nife"; knife
LOCATE 19, 28: COLOR 26: PRINT "(A)xe  "; axe
SLEEP

DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(112) THEN GOTO punchattack4
IF GASTON$ = CHR$(115) AND sword >= 1 THEN GOTO swordattack4
IF GASTON$ = CHR$(107) AND knife >= 1 THEN GOTO knifeattack4
IF GASTON$ = CHR$(97) AND axe >= 1 THEN GOTO axeattack4
LOOP

punchattack4:

IF experience >= 10 THEN
badattack = INT(RND * 80) + 1
goodattack = INT(RND * 2) + 1
END IF

IF experience >= 100 THEN
goodattack = INT(RND * 4) + 1
badattack = INT(RND * 75) + 1
END IF

IF experience >= 150 THEN
goodattack = INT(RND * 6) + 1
badattack = INT(RND * 70) + 1
END IF

IF experience >= 200 THEN
goodattack = INT(RND * 8) + 1
badattack = INT(RND * 65) + 1
END IF

bosslife = bosslife - goodattack
life = life - badattack
                             
IF bosslife <= 0 THEN bosslife = 0: showlife: win
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You punch Drake"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF bosslife > 0 THEN GOTO beginning4

IF bosslife <= 0 THEN bosslife = 0: showlife: win

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish4

swordattack4:

IF experience >= 10 THEN
badattack = INT(RND * 80) + 1
goodattack = INT(RND * 20) + 1
END IF

IF experience >= 100 THEN
goodattack = INT(RND * 22) + 1
badattack = INT(RND * 75) + 1
END IF

IF experience >= 150 THEN
goodattack = INT(RND * 24) + 1
badattack = INT(RND * 70) + 1
END IF

IF experience >= 200 THEN
goodattack = INT(RND * 65) + 1
badattack = INT(RND * 26) + 1
END IF

bosslife = bosslife - goodattack
life = life - badattack

IF bosslife <= 0 THEN bosslife = 0: showlife: win
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You attack Drake"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF bosslife > 0 THEN GOTO beginning4

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish4

knifeattack4:

IF experience >= 10 THEN
badattack = INT(RND * 79) + 1
goodattack = INT(RND * 12) + 1
END IF

IF experience >= 100 THEN
goodattack = INT(RND * 13) + 1
badattack = INT(RND * 74) + 1
END IF

IF experience >= 150 THEN
goodattack = INT(RND * 14) + 1
badattack = INT(RND * 69) + 1
END IF

IF experience >= 200 THEN
goodattack = INT(RND * 15) + 1
badattack = INT(RND * 64) + 1
END IF

bosslife = bosslife - goodattack
life = life - badattack

IF bosslife <= 0 THEN bosslife = 0: showlife: win
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You stab Darke"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF bosslife > 0 THEN GOTO beginning4

SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish4

axeattack4:

IF experience >= 10 THEN
badattack = INT(RND * 78) + 1
goodattack = INT(RND * 30) + 1
END IF

IF experience >= 100 THEN
goodattack = INT(RND * 31) + 1
badattack = INT(RND * 73) + 1
END IF

IF experience >= 150 THEN
goodattack = INT(RND * 32) + 1
badattack = INT(RND * 63) + 1
END IF

IF experience >= 200 THEN
goodattack = INT(RND * 33) + 1
badattack = INT(RND * 59) + 1
END IF

bosslife = bosslife - goodattack
life = life - badattack

IF bosslife <= 0 THEN bosslife = 0: showlife: win
IF life <= 0 THEN life = 0: Gameover

clearing
LOCATE 16, 5: PRINT "You attack Drake"
LOCATE 17, 5: PRINT "and he has"; goodattack; "damage"
HP = HP + 1
LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have"; badattack; "damage"

IF bosslife > 0 THEN GOTO beginning4
SLEEP

IF life <= 0 THEN
clearing
LOCATE 17, 5: PRINT "Your dead"
SLEEP
Gameover
END IF
GOTO finish4

Magic4:

clearing
x = 210
y = 110
LINE (1 + x, 1 + y)-(90 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(89 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(88 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(87 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(86 + x, 66 + y), 23, B
LINE (6 + x, 6 + y)-(85 + x, 65 + y), 0, BF

LOCATE 16, 28: COLOR 23: PRINT "(F)ire"; fire
LOCATE 17, 28: COLOR 24: PRINT "(I)ce "; ice
LOCATE 18, 28: COLOR 25: PRINT "(H)arm"; harm
LOCATE 20, 28: COLOR 25: PRINT "(B)ack"
DO
GASTON$ = INKEY$
IF GASTON$ = CHR$(98) THEN GOTO beginning4
IF GASTON$ = CHR$(102) AND fire >= 1 THEN GOTO fireattack4
IF GASTON$ = CHR$(105) AND ice >= 1 THEN GOTO iceattack4
IF GASTON$ = CHR$(104) AND harm >= 1 THEN GOTO harmattack4


LOOP

GOTO beginning4

fireattack4:
firernd = 1

IF firernd = 1 THEN

bosslife = bosslife - 23
fire = fire - 1

IF bosslife <= 0 THEN bosslife = 0: showlife: win

life = life - 7
LOCATE 2, 26: COLOR 23: PRINT "Life "; life

LOCATE 9, 26: COLOR 28: PRINT "Drake"; bosslife
LOCATE 16, 5: PRINT "Drake is on fire"
LOCATE 17, 5: PRINT "and gets 23 damage"

LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have 7 damage"


IF bosslife > 0 THEN GOTO beginning4
SLEEP
END IF


iceattack4:
icernd = 1

IF icernd = 1 THEN

bosslife = bosslife - 25
ice = ice - 1

IF bosslife <= 0 THEN bosslife = 0: showlife: win
life = life - 3
LOCATE 2, 26: COLOR 23: PRINT "Life "; life


LOCATE 9, 26: COLOR 28: PRINT "Drake"; bosslife
LOCATE 16, 5: PRINT "Enemey is on frozen"
LOCATE 17, 5: PRINT "and gets 25 damage"

LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have 3 damage"
IF bosslife > 0 THEN GOTO beginning4

SLEEP


END IF


harmattack4:
harmrnd = 1
IF harmrnd = 1 THEN

bosslife = bosslife
harm = harm - 1

IF bosslife <= 0 THEN bosslife = 0: showlife: win
life = life - 26
LOCATE 2, 26: COLOR 23: PRINT "Life "; life

LOCATE 9, 26: COLOR 28: PRINT "Drake"; bosslife
LOCATE 16, 5: PRINT "Spell is ineffective"
LOCATE 17, 5: PRINT "and he gets 0 damage"

LOCATE 19, 5: PRINT "He attacks you and"
LOCATE 20, 5: PRINT "you have 26 damage"

IF bosslife > 0 THEN GOTO beginning4

SLEEP
END IF


Potion4:
clearing
IF potions >= 1 THEN
life = 100
potions = potions - 1
LOCATE 2, 31: PRINT life
LOCATE 7, 32: PRINT potions
LOCATE 16, 5: PRINT "You feel stronger"
GOTO beginning4
SLEEP
END IF

IF potions <= 0 THEN
LOCATE 16, 5: PRINT "No potions"
GOTO beginning4
SLEEP

END IF

Runs4:
clearing
running = INT(RND * 3) + 1

IF running = 1 THEN
life = life - 31
LOCATE 16, 5: PRINT "Drake blocks"
LOCATE 17, 5: PRINT "you and you have"
LOCATE 18, 5: PRINT "31 damage."
SLEEP
GOTO beginning4
END IF

IF running = 2 THEN
LOCATE 16, 5:
PRINT "You get away"
SLEEP
GOTO finish4
END IF

IF running = 3 THEN
life = life - 5
LOCATE 16, 5: PRINT "You trip and fall."
LOCATE 17, 5: PRINT "You are attacked"
LOCATE 18, 5: PRINT "and have 5 damage"
SLEEP
GOTO beginning4
END IF

GOTO finish4

finish4:

CLS
Drawscreen
Pd

END SUB

SUB bossattackgraphics
CLS

x = 20
y = 0
LINE (1 + x, 1)-(145 + x, 101), 23, B
LINE (2 + x, 2)-(144 + x, 100), 24, B
LINE (3 + x, 3)-(143 + x, 99), 25, B
LINE (4 + x, 4)-(142 + x, 98), 24, B
LINE (5 + x, 5)-(141 + x, 97), 23, B

x = 72
y = 30


x = 190
y = 0

LINE (1 + x, 1 + y)-(100 + x, 100 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 99 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 98 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 97 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 96 + y), 23, B

y = 110
x = 20
LINE (1 + x, 1 + y)-(180 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(179 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(178 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(177 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(176 + x, 66 + y), 23, B


x = 210
y = 110
LINE (1 + x, 1 + y)-(90 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(89 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(88 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(87 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(86 + x, 66 + y), 23, B
LINE (6 + x, 6 + y)-(85 + x, 65 + y), 0, BF

PUT (26, 7), stones
PUT (41, 7), stones
PUT (56, 7), stones
PUT (71, 7), stones
PUT (86, 7), stones
PUT (101, 7), stones
PUT (116, 7), stones
PUT (131, 7), stones
PUT (146, 7), stones

PUT (26, 22), stones
PUT (41, 22), stones
PUT (56, 22), stones
PUT (71, 22), stones
PUT (86, 22), stones
PUT (101, 22), stones
PUT (116, 22), stones
PUT (131, 22), stones
PUT (146, 22), stones

PUT (26, 37), stones
PUT (41, 37), stones
PUT (56, 37), stones
PUT (71, 37), stones
PUT (101, 37), stones
PUT (116, 37), stones
PUT (131, 37), stones
PUT (146, 37), stones

PUT (26, 52), stones
PUT (41, 52), stones
PUT (56, 52), stones
PUT (71, 52), stones
PUT (101, 52), stones
PUT (116, 52), stones
PUT (131, 52), stones
PUT (146, 52), stones

PUT (26, 67), stones
PUT (41, 67), stones
PUT (56, 67), stones
PUT (71, 67), stones
PUT (86, 67), stones
PUT (101, 67), stones
PUT (116, 67), stones
PUT (131, 67), stones
PUT (146, 67), stones

PUT (26, 82), stones
PUT (41, 82), stones
PUT (56, 82), stones
PUT (71, 82), stones
PUT (86, 82), stones
PUT (101, 82), stones
PUT (116, 82), stones
PUT (131, 82), stones
PUT (146, 82), stones

PUT (86, 37), boss1
PUT (86, 52), boss2

END SUB

SUB buyweapons
x = 40
y = 40
LINE (1 + x, 1 + y)-(100 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 46 + y), 23, B
LINE (6 + x, 6 + y)-(95 + x, 45 + y), 16, BF


LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) AND gold >= 120 THEN gold = gold - 120: sword = sword + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: weapon = weapon + 1: LOCATE 6, 24: COLOR 23: PRINT "Weapons "; weapon
IF y = 61 AND GASTON$ = CHR$(32) AND gold >= 70 THEN gold = gold - 70: knife = knife + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: weapon = weapon + 1: LOCATE 6, 24: COLOR 23: PRINT "Weapons "; weapon
IF y = 91 AND GASTON$ = CHR$(32) AND gold >= 100 THEN gold = gold - 100: axe = axe + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: weapon = weapon + 1: LOCATE 6, 24: COLOR 23: PRINT "Weapons "; weapon


IF y = 121 AND GASTON$ = CHR$(32) THEN CLS : Drawscreen: Pd: Drawbox: Inventory: EXIT SUB


COLOR 7: IF y = 31 THEN LOCATE 7, 7: PRINT "Sword  120"
COLOR 7: IF y = 61 THEN LOCATE 8, 7: PRINT "Knife  70"
COLOR 7: IF y = 91 THEN LOCATE 9, 7: PRINT "Axe    100"
COLOR 7: IF y = 121 THEN LOCATE 10, 7: PRINT "Back"


IF y <> 31 THEN COLOR 24: LOCATE 7, 7: PRINT "Sword  120"
IF y <> 61 THEN COLOR 25: LOCATE 8, 7: PRINT "Knife  70"
IF y <> 91 THEN COLOR 25: LOCATE 9, 7: PRINT "Axe    100"
IF y <> 121 THEN COLOR 25: LOCATE 10, 7: PRINT "Back"


IF y > 121 THEN y = 31
IF y < 31 THEN y = 121

WEND
CLS : Drawscreen: Pd: Drawbox: Inventory: EXIT SUB

END SUB

SUB CheckTileDown

tile = map(pmx, pmy)
IF tile = 14 OR tile = 15 OR tile = 0 OR tile = 2 OR tile = 3 OR tile = 4 OR tile = 6 OR tile = 7 OR tile = 11 OR tile = 12 THEN

pmy = pmy - 1


END IF

END SUB

SUB CheckTileLeft

tile = map(pmx, pmy)

IF tile = 14 OR tile = 15 OR tile = 0 OR tile = 2 OR tile = 3 OR tile = 4 OR tile = 6 OR tile = 7 OR tile = 11 OR tile = 12 THEN
pmx = pmx + 1

END IF

END SUB

SUB CheckTileRight

tile = map(pmx, pmy)

IF tile = 14 OR tile = 15 OR tile = 0 OR tile = 2 OR tile = 3 OR tile = 4 OR tile = 6 OR tile = 7 OR tile = 11 OR tile = 12 THEN

pmx = pmx - 1

END IF

END SUB

SUB CheckTileUp

tile = map(pmx, pmy)

IF tile = 14 OR tile = 15 OR tile = 0 OR tile = 2 OR tile = 3 OR tile = 4 OR tile = 6 OR tile = 7 OR tile = 11 OR tile = 12 THEN

pmy = pmy + 1

END IF

END SUB

SUB clearing
y = 110
x = 20
LINE (6 + x, 6 + y)-(175 + x, 65 + y), 16, BF
END SUB

SUB Display
LOCATE 22, 1
COLOR 23: PRINT pmx; " "; pmy
LOCATE 1, 1: COLOR 24: PRINT "Life"; life
LOCATE 1, 12: COLOR 24: PRINT "Gold"; gold
END SUB

SUB Drawbox
LINE (1, 1)-(150, 60), 23, B
LINE (2, 2)-(149, 59), 24, B
LINE (3, 3)-(148, 58), 25, B
LINE (4, 4)-(147, 57), 24, B
LINE (5, 5)-(146, 56), 23, B
LINE (6, 6)-(145, 55), 16, BF


END SUB

SUB Drawscreen

FOR x = -5 TO 5
FOR y = -4 TO 4
                                       
tile = map(pmx + x, pmy + y)
                                       
spotx = ppx + x * 15
spoty = ppy + y * 15

IF tile = 0 THEN PUT (spotx, spoty), blank, PSET
IF tile = 1 THEN PUT (spotx, spoty), grass, PSET
IF tile = 2 THEN PUT (spotx, spoty), wall, PSET
IF tile = 3 THEN PUT (spotx, spoty), water, PSET
IF tile = 4 THEN PUT (spotx, spoty), tree, PSET
IF tile = 5 THEN PUT (spotx, spoty), stones, PSET
IF tile = 6 THEN PUT (spotx, spoty), tiles, PSET
IF tile = 7 THEN PUT (spotx, spoty), windows, PSET
IF tile = 8 THEN PUT (spotx, spoty), door, PSET
IF tile = 9 THEN PUT (spotx, spoty), bridge, PSET
IF tile = 10 THEN PUT (spotx, spoty), castle, PSET
IF tile = 11 THEN PUT (spotx, spoty), fountain, PSET
IF tile = 12 THEN PUT (spotx, spoty), clerk, PSET
IF tile = 13 THEN PUT (spotx, spoty), stairs, PSET
IF tile = 14 THEN PUT (spotx, spoty), boss1, PSET
IF tile = 15 THEN PUT (spotx, spoty), boss2, PSET






NEXT y
NEXT x

END SUB

SUB Gameover
CLS

LOCATE 5, 11: COLOR 23: PRINT "Adventures of Gasin"
LOCATE 6, 19: COLOR 24: PRINT "by"
LOCATE 7, 13: COLOR 25: PRINT "Gaston Gonzalez"

END
END SUB

SUB Health

x = 40
y = 40
LINE (1 + x, 1 + y)-(100 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 46 + y), 23, B
LINE (6 + x, 6 + y)-(95 + x, 45 + y), 16, BF



LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) AND gold >= 30 THEN Potion
IF y = 61 AND GASTON$ = CHR$(32) THEN CLS : Drawscreen: Pd: Drawbox: Inventory: EXIT SUB


COLOR 7: IF y = 31 THEN LOCATE 7, 7: PRINT "Heal    30"
COLOR 7: IF y = 61 THEN LOCATE 8, 7: PRINT "Back      "

IF y <> 31 THEN COLOR 24: LOCATE 7, 7: PRINT "Heal    30"
IF y <> 61 THEN COLOR 25: LOCATE 8, 7: PRINT "Back"

IF y > 61 THEN y = 31
IF y < 31 THEN y = 61

WEND

END SUB

SUB Inventory
x = 175
y = 10

LINE (1 + x, 1 + y)-(119 + x, 65 + y), 23, B
LINE (2 + x, 2 + y)-(118 + x, 64 + y), 24, B
LINE (3 + x, 3 + y)-(117 + x, 63 + y), 25, B
LINE (4 + x, 4 + y)-(116 + x, 62 + y), 24, B
LINE (5 + x, 5 + y)-(115 + x, 61 + y), 23, B
LINE (6 + x, 6 + y)-(114 + x, 60 + y), 16, BF

LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold
LOCATE 5, 24: COLOR 24: PRINT "Magic   "; amagic
LOCATE 6, 24: COLOR 25: PRINT "Weapon  "; weapon
LOCATE 7, 24: COLOR 26: PRINT "Potions "; potions

END SUB

SUB Loadgame
LOCATE 20, 9: INPUT "Name"; file$
COLOR 7: LOCATE 1, 1: PRINT "Loading..."

OPEN "c:\Gasin\" + file$ + ".sav" FOR INPUT AS #1
INPUT #1, life
INPUT #1, gold
INPUT #1, HP
INPUT #1, experience
INPUT #1, potions
INPUT #1, playerselect
INPUT #1, fire
INPUT #1, ice
INPUT #1, harm
INPUT #1, sword
INPUT #1, knife
INPUT #1, axe
INPUT #1, weapon
INPUT #1, amagic
CLOSE

END SUB

SUB loadgraphics

CLS

LINE (1, 1)-(15, 15), 0, BF
LINE (1, 1)-(15, 15), 3, BF
LINE (1, 15)-(15, 15), 17, BF
LINE (1, 13)-(1, 14), 17
PSET (4, 14), 17
LINE (2, 14)-(3, 14), 23, BF
PSET (10, 14), 17
LINE (5, 14)-(9, 14), 23, BF
LINE (11, 14)-(14, 14), 23, BF
LINE (15, 13)-(15, 14), 17
PSET (5, 13), 17
LINE (2, 13)-(4, 13), 26
LINE (6, 13)-(11, 13), 26
PSET (12, 13), 17
LINE (13, 13)-(14, 13), 26
LINE (1, 12)-(14, 12), 17
PSET (15, 12), 26
PSET (1, 11), 26
PSET (2, 11), 17
LINE (3, 11)-(8, 11), 23
PSET (9, 11), 17
LINE (10, 11)-(14, 11), 23
PSET (15, 11), 17


LINE (1, 10)-(15, 10), 17, BF
LINE (1, 8)-(1, 9), 17
PSET (4, 9), 17
LINE (2, 9)-(3, 9), 23, BF
PSET (10, 9), 17
LINE (5, 9)-(9, 9), 23, BF
LINE (11, 9)-(14, 9), 23, BF
LINE (15, 8)-(15, 9), 17
PSET (5, 8), 17
LINE (2, 8)-(4, 8), 26
LINE (6, 8)-(11, 8), 26
PSET (12, 8), 17
LINE (13, 8)-(14, 8), 26
LINE (1, 7)-(14, 7), 17
PSET (15, 7), 26
PSET (1, 6), 26
PSET (2, 6), 17
LINE (3, 6)-(8, 6), 23
PSET (9, 6), 17
LINE (10, 6)-(14, 6), 23
PSET (15, 6), 17

LINE (1, 5)-(15, 5), 17, BF
LINE (1, 3)-(1, 4), 17
PSET (4, 4), 17
LINE (2, 4)-(3, 4), 23, BF
PSET (10, 4), 17
LINE (5, 4)-(9, 4), 23, BF
LINE (11, 4)-(14, 4), 23, BF
LINE (15, 3)-(15, 4), 17
PSET (5, 3), 17
LINE (2, 3)-(4, 3), 26
LINE (6, 3)-(11, 3), 26
PSET (12, 3), 17
LINE (13, 3)-(14, 3), 26
LINE (1, 2)-(14, 2), 17
PSET (15, 2), 26
PSET (1, 1), 26
PSET (2, 1), 17
LINE (3, 1)-(8, 1), 23
PSET (9, 1), 17
LINE (10, 1)-(14, 1), 23
PSET (15, 1), 17
PSET (5, 1), 41
PSET (6, 1), 41
PSET (7, 1), 41
PSET (8, 1), 41
PSET (9, 1), 41
PSET (10, 1), 41
PSET (11, 1), 41
PSET (12, 2), 41
PSET (11, 2), 41
PSET (10, 2), 41
PSET (9, 2), 41
PSET (8, 2), 41
PSET (7, 2), 41
PSET (6, 2), 41
PSET (5, 2), 41
PSET (4, 2), 41
PSET (4, 3), 41
PSET (4, 4), 41
PSET (4, 5), 41
PSET (4, 6), 41
PSET (5, 6), 41
PSET (6, 6), 41
PSET (5, 5), 41
PSET (12, 3), 41
PSET (12, 4), 41
PSET (12, 5), 41
PSET (12, 6), 41
PSET (11, 6), 41
PSET (10, 6), 41
PSET (11, 5), 41
PSET (11, 4), 88
PSET (11, 3), 88
PSET (10, 3), 88
PSET (9, 3), 88
PSET (8, 3), 88
PSET (7, 3), 88
PSET (6, 3), 88
PSET (5, 3), 88
PSET (5, 4), 88
PSET (6, 4), 88
PSET (7, 4), 88
PSET (8, 4), 88
PSET (9, 4), 88
PSET (10, 4), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (7, 5), 88
PSET (6, 5), 88
PSET (8, 5), 88
PSET (8, 6), 88
PSET (9, 6), 88
PSET (7, 6), 88
PSET (7, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 7), 88
PSET (6, 7), 88
PSET (7, 8), 88
PSET (8, 8), 88
PSET (9, 8), 88
PSET (6, 4), 88
PSET (6, 4), 16
PSET (10, 4), 16
PSET (9, 4), 16
PSET (9, 5), 16
PSET (8, 4), 16
PSET (7, 4), 16
PSET (7, 5), 16
PSET (10, 9), 16
PSET (10, 9), 41
PSET (11, 9), 41
PSET (12, 9), 41
PSET (13, 9), 41
PSET (13, 10), 41
PSET (12, 10), 41
PSET (11, 10), 41
PSET (3, 9), 41
PSET (4, 9), 41
PSET (5, 9), 41
PSET (6, 9), 41
PSET (5, 10), 41
PSET (4, 10), 41
PSET (3, 10), 41
PSET (6, 10), 42
PSET (7, 10), 42
PSET (7, 9), 42
PSET (8, 9), 42
PSET (9, 9), 42
PSET (9, 10), 42
PSET (10, 10), 42
PSET (8, 10), 42
PSET (8, 11), 42
PSET (9, 11), 42
PSET (10, 11), 42
PSET (10, 12), 42
PSET (10, 13), 42
PSET (9, 13), 42
PSET (8, 13), 42
PSET (7, 13), 42
PSET (6, 13), 42
PSET (6, 12), 42
PSET (6, 11), 42
PSET (7, 11), 42
PSET (7, 12), 42
PSET (8, 12), 42
PSET (9, 12), 42
PSET (10, 12), 42
PSET (11, 12), 42
PSET (12, 13), 42
PSET (11, 13), 42
PSET (4, 13), 42
PSET (5, 13), 42
PSET (5, 12), 42
PSET (5, 11), 42
PSET (10, 11), 42
PSET (11, 11), 42
PSET (12, 11), 88
PSET (13, 11), 88
PSET (13, 12), 88
PSET (12, 12), 88
PSET (10, 12), 6
PSET (10, 11), 6
PSET (10, 10), 6
PSET (11, 10), 6
PSET (12, 10), 6
PSET (13, 10), 6
PSET (14, 10), 6
PSET (15, 10), 6
PSET (15, 11), 6
PSET (15, 12), 6
PSET (15, 13), 6
PSET (15, 14), 6
PSET (14, 15), 6
PSET (13, 15), 6
PSET (12, 15), 6
PSET (11, 15), 6
PSET (10, 14), 6
PSET (10, 13), 6
PSET (11, 13), 42
PSET (11, 14), 42
PSET (12, 14), 42
PSET (13, 14), 42
PSET (14, 14), 42
PSET (14, 13), 42
PSET (14, 12), 42
PSET (14, 11), 42
PSET (13, 11), 42
PSET (12, 11), 42
PSET (13, 12), 42
PSET (12, 12), 42
PSET (13, 13), 42
PSET (13, 13), 16
PSET (12, 12), 16
PSET (3, 11), 88
PSET (4, 11), 88
PSET (4, 12), 88
PSET (3, 12), 88
PSET (3, 13), 88
PSET (4, 13), 88
PSET (4, 14), 88
PSET (5, 14), 43
PSET (6, 14), 43
PSET (7, 14), 43
PSET (8, 14), 43
PSET (9, 14), 43
PSET (9, 15), 42
PSET (10, 15), 42
PSET (8, 15), 42
PSET (7, 15), 42
PSET (6, 15), 42
PSET (5, 15), 42
PSET (2, 15), 115
PSET (2, 14), 115
PSET (2, 13), 115
PSET (2, 12), 115
PSET (2, 11), 115
PSET (2, 10), 115
PSET (2, 9), 115
PSET (2, 8), 115
PSET (2, 7), 23
PSET (3, 7), 23
PSET (2, 6), 23
PSET (1, 7), 23
PSET (2, 5), 23
GET (1, 1)-(15, 15), boss1

LINE (1, 1)-(15, 15), 0, BF
LINE (1, 1)-(15, 15), 3, BF
LINE (1, 15)-(15, 15), 17, BF
LINE (1, 13)-(1, 14), 17
PSET (4, 14), 17
LINE (2, 14)-(3, 14), 23, BF
PSET (10, 14), 17
LINE (5, 14)-(9, 14), 23, BF
LINE (11, 14)-(14, 14), 23, BF
LINE (15, 13)-(15, 14), 17
PSET (5, 13), 17
LINE (2, 13)-(4, 13), 26
LINE (6, 13)-(11, 13), 26
PSET (12, 13), 17
LINE (13, 13)-(14, 13), 26
LINE (1, 12)-(14, 12), 17
PSET (15, 12), 26
PSET (1, 11), 26
PSET (2, 11), 17
LINE (3, 11)-(8, 11), 23
PSET (9, 11), 17
LINE (10, 11)-(14, 11), 23
PSET (15, 11), 17


LINE (1, 10)-(15, 10), 17, BF
LINE (1, 8)-(1, 9), 17
PSET (4, 9), 17
LINE (2, 9)-(3, 9), 23, BF
PSET (10, 9), 17
LINE (5, 9)-(9, 9), 23, BF
LINE (11, 9)-(14, 9), 23, BF
LINE (15, 8)-(15, 9), 17
PSET (5, 8), 17
LINE (2, 8)-(4, 8), 26
LINE (6, 8)-(11, 8), 26
PSET (12, 8), 17
LINE (13, 8)-(14, 8), 26
LINE (1, 7)-(14, 7), 17
PSET (15, 7), 26
PSET (1, 6), 26
PSET (2, 6), 17
LINE (3, 6)-(8, 6), 23
PSET (9, 6), 17
LINE (10, 6)-(14, 6), 23
PSET (15, 6), 17

LINE (1, 5)-(15, 5), 17, BF
LINE (1, 3)-(1, 4), 17
PSET (4, 4), 17
LINE (2, 4)-(3, 4), 23, BF
PSET (10, 4), 17
LINE (5, 4)-(9, 4), 23, BF
LINE (11, 4)-(14, 4), 23, BF
LINE (15, 3)-(15, 4), 17
PSET (5, 3), 17
LINE (2, 3)-(4, 3), 26
LINE (6, 3)-(11, 3), 26
PSET (12, 3), 17
LINE (13, 3)-(14, 3), 26
LINE (1, 2)-(14, 2), 17
PSET (15, 2), 26
PSET (1, 1), 26
PSET (2, 1), 17
LINE (3, 1)-(8, 1), 23
PSET (9, 1), 17
LINE (10, 1)-(14, 1), 23
PSET (15, 1), 17
PSET (5, 1), 43
PSET (5, 1), 43
PSET (6, 1), 43
PSET (7, 1), 43
PSET (8, 1), 43
PSET (9, 1), 43
PSET (10, 1), 43
PSET (11, 1), 43
PSET (11, 2), 43
PSET (11, 3), 43
PSET (10, 3), 43
PSET (10, 2), 43
PSET (9, 2), 43
PSET (9, 3), 43
PSET (7, 3), 43
PSET (7, 2), 43
PSET (6, 2), 43
PSET (5, 2), 43
PSET (5, 3), 43
PSET (6, 3), 43
PSET (6, 4), 43
PSET (7, 4), 43
PSET (5, 4), 43
PSET (7, 5), 43
PSET (9, 4), 43
PSET (10, 4), 43
PSET (11, 4), 43
PSET (11, 5), 42
PSET (10, 5), 42
PSET (9, 5), 42
PSET (9, 6), 42
PSET (10, 6), 42
PSET (11, 6), 42
PSET (7, 6), 42
PSET (6, 6), 42
PSET (5, 6), 42
PSET (5, 5), 42
PSET (6, 5), 42
PSET (7, 5), 42
PSET (2, 5), 115
PSET (2, 6), 115
PSET (2, 4), 115
PSET (2, 3), 115
PSET (2, 2), 115
PSET (2, 1), 115
GET (1, 1)-(15, 15), boss2

LINE (1, 1)-(15, 15), 0, BF
PSET (1, 15), 18
PSET (2, 15), 18
PSET (3, 15), 18
PSET (3, 14), 18
PSET (3, 13), 18
PSET (3, 12), 18
PSET (3, 11), 18
PSET (3, 10), 18
PSET (3, 9), 18
PSET (3, 8), 18
PSET (3, 7), 18
PSET (3, 6), 18
PSET (2, 6), 25
PSET (1, 6), 25
PSET (1, 7), 25
PSET (1, 8), 25
PSET (1, 9), 25
PSET (1, 10), 25
PSET (1, 11), 25
PSET (1, 12), 25
PSET (1, 13), 25
PSET (1, 14), 25
PSET (2, 14), 25
PSET (2, 13), 25
PSET (2, 12), 25
PSET (2, 11), 25
PSET (2, 10), 25
PSET (2, 9), 25
PSET (2, 8), 25
PSET (2, 7), 25
PSET (4, 7), 25
PSET (4, 8), 25
PSET (4, 9), 25
PSET (4, 10), 25
PSET (4, 11), 25
PSET (4, 12), 25
PSET (4, 13), 25
PSET (5, 13), 25
PSET (5, 12), 25
PSET (5, 11), 25
PSET (5, 10), 25
PSET (5, 9), 25
PSET (5, 8), 25
PSET (5, 7), 25
PSET (5, 6), 25
PSET (4, 6), 25
PSET (4, 5), 25
PSET (5, 5), 25
PSET (6, 5), 18
PSET (6, 6), 18
PSET (6, 7), 18
PSET (6, 8), 18
PSET (6, 9), 18
PSET (6, 10), 18
PSET (6, 11), 18
PSET (6, 12), 18
PSET (6, 13), 18
PSET (6, 14), 18
PSET (5, 14), 18
PSET (4, 14), 18
PSET (7, 13), 18
PSET (8, 13), 18
PSET (9, 13), 18
PSET (9, 12), 18
PSET (9, 11), 18
PSET (9, 10), 18
PSET (9, 9), 18
PSET (9, 8), 18
PSET (9, 7), 18
PSET (9, 6), 18
PSET (9, 5), 18
PSET (9, 4), 18
PSET (8, 4), 25
PSET (7, 4), 25
PSET (7, 5), 25
PSET (7, 6), 25
PSET (7, 7), 25
PSET (7, 8), 25
PSET (7, 9), 25
PSET (7, 10), 25
PSET (7, 11), 25
PSET (7, 12), 25
PSET (8, 12), 25
PSET (8, 11), 25
PSET (8, 10), 25
PSET (8, 9), 25
PSET (8, 8), 25
PSET (8, 7), 25
PSET (8, 6), 25
PSET (8, 5), 25
PSET (10, 11), 18
PSET (10, 12), 18
PSET (11, 12), 18
PSET (12, 12), 18
PSET (12, 11), 18
PSET (12, 10), 18
PSET (12, 9), 18
PSET (12, 8), 18
PSET (12, 7), 18
PSET (12, 6), 18
PSET (12, 5), 18
PSET (12, 4), 18
PSET (12, 3), 18
PSET (11, 3), 25
PSET (10, 3), 25
PSET (10, 4), 25
PSET (10, 5), 25
PSET (10, 6), 25
PSET (10, 7), 25
PSET (10, 8), 25
PSET (10, 9), 25
PSET (10, 10), 25
PSET (10, 11), 25
PSET (11, 11), 25
PSET (11, 10), 25
PSET (11, 9), 25
PSET (11, 8), 25
PSET (11, 7), 25
PSET (11, 6), 25
PSET (11, 5), 25
PSET (11, 4), 25
PSET (13, 4), 25
PSET (13, 3), 25
PSET (13, 2), 25
PSET (14, 2), 25
PSET (14, 3), 25
PSET (14, 4), 25
PSET (14, 5), 25
PSET (14, 6), 25
PSET (14, 7), 25
PSET (14, 8), 25
PSET (14, 9), 25
PSET (14, 10), 25
PSET (13, 6), 25
PSET (13, 5), 25
PSET (13, 7), 25
PSET (13, 8), 25
PSET (13, 9), 25
PSET (13, 10), 25
PSET (13, 11), 25
PSET (14, 11), 25
PSET (13, 11), 18
PSET (14, 11), 18
PSET (15, 10), 18
PSET (15, 9), 18
PSET (15, 8), 18
PSET (15, 7), 18
PSET (15, 6), 18
PSET (15, 5), 18
PSET (15, 4), 18
PSET (15, 3), 18
PSET (15, 2), 18
GET (1, 1)-(15, 15), stairs

GET (1, 1)-(15, 15), blank

LINE (1, 1)-(15, 15), 255, BF
PSET (11, 15), 15
PSET (10, 15), 15
PSET (9, 15), 15
PSET (8, 15), 15
PSET (7, 15), 15
PSET (6, 15), 114
PSET (5, 15), 114
PSET (4, 15), 114
PSET (5, 14), 15
PSET (6, 14), 15
PSET (7, 14), 15
PSET (8, 14), 15
PSET (9, 14), 15
PSET (10, 14), 15
PSET (11, 14), 15
PSET (10, 13), 15
PSET (9, 13), 15
PSET (8, 13), 88
PSET (7, 13), 88
PSET (6, 13), 15
PSET (5, 13), 15
PSET (5, 12), 15
PSET (6, 12), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (10, 12), 15
PSET (9, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (6, 11), 15
PSET (5, 11), 15
PSET (5, 10), 15
PSET (6, 10), 15
PSET (7, 10), 15
PSET (8, 10), 15
PSET (9, 10), 15
PSET (8, 9), 15
PSET (7, 9), 15
PSET (6, 9), 15
PSET (6, 8), 88
PSET (7, 8), 88
PSET (8, 8), 88
PSET (5, 7), 88
PSET (6, 7), 88
PSET (7, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 7), 114
PSET (11, 6), 114
PSET (10, 6), 114
PSET (9, 6), 88
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 6), 88
PSET (4, 6), 88
PSET (5, 5), 88
PSET (6, 5), 16
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 114
PSET (10, 5), 114
PSET (11, 5), 114
PSET (11, 4), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (5, 4), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114

GET (1, 1)-(15, 15), wmageleftmask

LINE (1, 1)-(15, 15), 0, BF
PSET (11, 15), 15
PSET (10, 15), 15
PSET (9, 15), 15
PSET (8, 15), 15
PSET (7, 15), 15
PSET (6, 15), 114
PSET (5, 15), 114
PSET (4, 15), 114
PSET (5, 14), 15
PSET (6, 14), 15
PSET (7, 14), 15
PSET (8, 14), 15
PSET (9, 14), 15
PSET (10, 14), 15
PSET (11, 14), 15
PSET (10, 13), 15
PSET (9, 13), 15
PSET (8, 13), 88
PSET (7, 13), 88
PSET (6, 13), 15
PSET (5, 13), 15
PSET (5, 12), 15
PSET (6, 12), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (10, 12), 15
PSET (9, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (6, 11), 15
PSET (5, 11), 15
PSET (5, 10), 15
PSET (6, 10), 15
PSET (7, 10), 15
PSET (8, 10), 15
PSET (9, 10), 15
PSET (8, 9), 15
PSET (7, 9), 15
PSET (6, 9), 15
PSET (6, 8), 88
PSET (7, 8), 88
PSET (8, 8), 88
PSET (5, 7), 88
PSET (6, 7), 88
PSET (7, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 7), 114
PSET (11, 6), 114
PSET (10, 6), 114
PSET (9, 6), 88
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 6), 88
PSET (4, 6), 88
PSET (5, 5), 88
PSET (6, 5), 16
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 114
PSET (10, 5), 114
PSET (11, 5), 114
PSET (11, 4), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (5, 4), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114

GET (1, 1)-(15, 15), wmageleft

LINE (1, 1)-(15, 15), 255, BF
PSET (9, 13), 88
PSET (8, 13), 88
PSET (8, 11), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (9, 11), 15
PSET (9, 10), 15
PSET (10, 10), 15
PSET (10, 11), 15
PSET (10, 12), 15
PSET (10, 13), 15
PSET (10, 14), 15
PSET (9, 14), 15
PSET (8, 14), 15
PSET (7, 14), 15
PSET (6, 14), 15
PSET (5, 14), 15
PSET (6, 13), 15
PSET (7, 13), 15
PSET (7, 12), 15
PSET (6, 12), 15
PSET (7, 11), 15
PSET (7, 10), 15
PSET (8, 10), 15
PSET (9, 9), 15
PSET (10, 9), 15
PSET (8, 9), 15
PSET (8, 8), 88
PSET (9, 8), 88
PSET (10, 8), 88
PSET (10, 7), 88
PSET (11, 7), 88
PSET (9, 7), 88
PSET (8, 7), 88
PSET (7, 7), 88
PSET (7, 6), 88
PSET (8, 6), 88
PSET (9, 6), 88
PSET (10, 6), 88
PSET (11, 6), 88
PSET (12, 6), 88
PSET (11, 5), 88
PSET (10, 5), 88
PSET (9, 5), 88
PSET (8, 5), 88
PSET (7, 5), 88
PSET (6, 5), 114
PSET (6, 6), 114
PSET (6, 7), 114
PSET (5, 6), 114
PSET (5, 5), 114
PSET (5, 4), 114
PSET (6, 4), 114
PSET (7, 4), 114
PSET (8, 4), 114
PSET (9, 4), 114
PSET (10, 4), 114
PSET (11, 4), 114
PSET (10, 3), 114
PSET (9, 3), 114
PSET (8, 3), 114
PSET (7, 3), 114
PSET (6, 3), 114
PSET (6, 5), 114
PSET (7, 5), 114
PSET (10, 5), 16
PSET (11, 10), 15
PSET (11, 11), 15
PSET (11, 12), 15
PSET (11, 13), 15
PSET (11, 14), 15
PSET (10, 15), 114
PSET (11, 15), 114
PSET (12, 15), 114
PSET (9, 15), 15
PSET (8, 15), 15
PSET (7, 15), 15
PSET (6, 15), 15
PSET (5, 15), 15

GET (1, 1)-(15, 15), wmagerightmask


LINE (1, 1)-(15, 15), 0, BF
PSET (9, 13), 88
PSET (8, 13), 88
PSET (8, 11), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (9, 11), 15
PSET (9, 10), 15
PSET (10, 10), 15
PSET (10, 11), 15
PSET (10, 12), 15
PSET (10, 13), 15
PSET (10, 14), 15
PSET (9, 14), 15
PSET (8, 14), 15
PSET (7, 14), 15
PSET (6, 14), 15
PSET (5, 14), 15
PSET (6, 13), 15
PSET (7, 13), 15
PSET (7, 12), 15
PSET (6, 12), 15
PSET (7, 11), 15
PSET (7, 10), 15
PSET (8, 10), 15
PSET (9, 9), 15
PSET (10, 9), 15
PSET (8, 9), 15
PSET (8, 8), 88
PSET (9, 8), 88
PSET (10, 8), 88
PSET (10, 7), 88
PSET (11, 7), 88
PSET (9, 7), 88
PSET (8, 7), 88
PSET (7, 7), 88
PSET (7, 6), 88
PSET (8, 6), 88
PSET (9, 6), 88
PSET (10, 6), 88
PSET (11, 6), 88
PSET (12, 6), 88
PSET (11, 5), 88
PSET (10, 5), 88
PSET (9, 5), 88
PSET (8, 5), 88
PSET (7, 5), 88
PSET (6, 5), 114
PSET (6, 6), 114
PSET (6, 7), 114
PSET (5, 6), 114
PSET (5, 5), 114
PSET (5, 4), 114
PSET (6, 4), 114
PSET (7, 4), 114
PSET (8, 4), 114
PSET (9, 4), 114
PSET (10, 4), 114
PSET (11, 4), 114
PSET (10, 3), 114
PSET (9, 3), 114
PSET (8, 3), 114
PSET (7, 3), 114
PSET (6, 3), 114
PSET (6, 5), 114
PSET (7, 5), 114
PSET (10, 5), 16
PSET (11, 10), 15
PSET (11, 11), 15
PSET (11, 12), 15
PSET (11, 13), 15
PSET (11, 14), 15
PSET (10, 15), 114
PSET (11, 15), 114
PSET (12, 15), 114
PSET (9, 15), 15
PSET (8, 15), 15
PSET (7, 15), 15
PSET (6, 15), 15
PSET (5, 15), 15

GET (1, 1)-(15, 15), wmageright

LINE (1, 1)-(15, 15), 255, BF
PSET (5, 15), 15
PSET (6, 15), 15
PSET (7, 15), 15
PSET (8, 15), 15
PSET (9, 15), 15
PSET (10, 15), 15
PSET (11, 15), 15
PSET (10, 14), 15
PSET (9, 14), 15
PSET (8, 14), 15
PSET (6, 14), 15
PSET (7, 14), 15
PSET (6, 13), 15
PSET (7, 13), 15
PSET (8, 13), 15
PSET (9, 13), 15
PSET (10, 13), 15
PSET (12, 13), 15
PSET (4, 13), 15
PSET (3, 12), 15
PSET (3, 11), 15
PSET (3, 10), 15
PSET (4, 9), 15
PSET (5, 10), 15
PSET (5, 11), 15
PSET (5, 12), 15
PSET (4, 12), 15
PSET (4, 11), 15
PSET (4, 10), 15
PSET (6, 10), 15
PSET (6, 11), 15
PSET (6, 12), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (10, 12), 15
PSET (11, 12), 15
PSET (12, 12), 15
PSET (13, 12), 15
PSET (13, 11), 15
PSET (13, 10), 15
PSET (12, 10), 15
PSET (12, 11), 15
PSET (11, 11), 15
PSET (10, 11), 15
PSET (9, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (8, 10), 15
PSET (7, 10), 15
PSET (10, 10), 15
PSET (11, 10), 15
PSET (8, 10), 15
PSET (7, 10), 15
PSET (6, 10), 15
PSET (9, 10), 15
PSET (8, 10), 9
PSET (9, 9), 9
PSET (8, 9), 9
PSET (7, 9), 9
PSET (6, 9), 15
PSET (5, 9), 15
PSET (11, 9), 15
PSET (10, 9), 15
PSET (12, 9), 15
PSET (8, 8), 88
PSET (9, 8), 88
PSET (7, 8), 88
PSET (7, 7), 114
PSET (8, 7), 114
PSET (9, 7), 114
PSET (10, 7), 114
PSET (6, 7), 114
PSET (5, 6), 114
PSET (6, 6), 114
PSET (7, 6), 114
PSET (8, 6), 114
PSET (9, 6), 114
PSET (10, 6), 114
PSET (11, 6), 114
PSET (12, 5), 114
PSET (11, 5), 114
PSET (10, 5), 114
PSET (9, 5), 114
PSET (8, 5), 114
PSET (7, 5), 114
PSET (6, 5), 114
PSET (5, 5), 114
PSET (4, 5), 114
PSET (4, 4), 114
PSET (4, 3), 114
PSET (5, 3), 114
PSET (5, 4), 114
PSET (6, 4), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (7, 4), 114
PSET (8, 4), 114
PSET (9, 4), 114
PSET (10, 4), 114
PSET (11, 4), 114
PSET (12, 4), 114
PSET (12, 3), 114
PSET (11, 3), 114
PSET (10, 3), 114
PSET (9, 3), 114
PSET (8, 3), 114
PSET (8, 2), 114
PSET (9, 2), 114
PSET (10, 2), 114
PSET (11, 2), 114
PSET (8, 2), 114
PSET (7, 2), 114
PSET (6, 2), 114
PSET (5, 2), 114
GET (1, 1)-(15, 15), wmageupmask



LINE (1, 1)-(15, 15), 0, BF
PSET (5, 15), 15
PSET (6, 15), 15
PSET (7, 15), 15
PSET (8, 15), 15
PSET (9, 15), 15
PSET (10, 15), 15
PSET (11, 15), 15
PSET (10, 14), 15
PSET (9, 14), 15
PSET (8, 14), 15
PSET (6, 14), 15
PSET (7, 14), 15
PSET (6, 13), 15
PSET (7, 13), 15
PSET (8, 13), 15
PSET (9, 13), 15
PSET (10, 13), 15
PSET (12, 13), 15
PSET (4, 13), 15
PSET (3, 12), 15
PSET (3, 11), 15
PSET (3, 10), 15
PSET (4, 9), 15
PSET (5, 10), 15
PSET (5, 11), 15
PSET (5, 12), 15
PSET (4, 12), 15
PSET (4, 11), 15
PSET (4, 10), 15
PSET (6, 10), 15
PSET (6, 11), 15
PSET (6, 12), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (10, 12), 15
PSET (11, 12), 15
PSET (12, 12), 15
PSET (13, 12), 15
PSET (13, 11), 15
PSET (13, 10), 15
PSET (12, 10), 15
PSET (12, 11), 15
PSET (11, 11), 15
PSET (10, 11), 15
PSET (9, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (8, 10), 15
PSET (7, 10), 15
PSET (10, 10), 15
PSET (11, 10), 15
PSET (8, 10), 15
PSET (7, 10), 15
PSET (6, 10), 15
PSET (9, 10), 15
PSET (8, 10), 9
PSET (9, 9), 9
PSET (8, 9), 9
PSET (7, 9), 9
PSET (6, 9), 15
PSET (5, 9), 15
PSET (11, 9), 15
PSET (10, 9), 15
PSET (12, 9), 15
PSET (8, 8), 88
PSET (9, 8), 88
PSET (7, 8), 88
PSET (7, 7), 114
PSET (8, 7), 114
PSET (9, 7), 114
PSET (10, 7), 114
PSET (6, 7), 114
PSET (5, 6), 114
PSET (6, 6), 114
PSET (7, 6), 114
PSET (8, 6), 114
PSET (9, 6), 114
PSET (10, 6), 114
PSET (11, 6), 114
PSET (12, 5), 114
PSET (11, 5), 114
PSET (10, 5), 114
PSET (9, 5), 114
PSET (8, 5), 114
PSET (7, 5), 114
PSET (6, 5), 114
PSET (5, 5), 114
PSET (4, 5), 114
PSET (4, 4), 114
PSET (4, 3), 114
PSET (5, 3), 114
PSET (5, 4), 114
PSET (6, 4), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (7, 4), 114
PSET (8, 4), 114
PSET (9, 4), 114
PSET (10, 4), 114
PSET (11, 4), 114
PSET (12, 4), 114
PSET (12, 3), 114
PSET (11, 3), 114
PSET (10, 3), 114
PSET (9, 3), 114
PSET (8, 3), 114
PSET (8, 2), 114
PSET (9, 2), 114
PSET (10, 2), 114
PSET (11, 2), 114
PSET (8, 2), 114
PSET (7, 2), 114
PSET (6, 2), 114
PSET (5, 2), 114
GET (1, 1)-(15, 15), wmageup

LINE (1, 1)-(15, 15), 0, BF
PSET (5, 15), 15
PSET (6, 14), 15
PSET (6, 13), 15
PSET (6, 12), 15
PSET (4, 13), 15
PSET (5, 12), 15
PSET (3, 12), 15
PSET (3, 11), 15
PSET (3, 10), 15
PSET (4, 9), 15
PSET (5, 10), 15
PSET (5, 11), 15
PSET (4, 12), 88
PSET (4, 11), 88
PSET (4, 10), 9
PSET (11, 15), 15
PSET (10, 14), 15
PSET (10, 13), 15
PSET (10, 12), 15
PSET (11, 12), 15
PSET (12, 13), 15
PSET (13, 12), 15
PSET (13, 11), 15
PSET (13, 10), 15
PSET (12, 9), 15
PSET (11, 10), 15
PSET (11, 11), 15
PSET (12, 12), 88
PSET (12, 11), 88
PSET (12, 10), 9
PSET (9, 9), 9
PSET (8, 9), 9
PSET (7, 9), 9
PSET (8, 10), 9
PSET (8, 15), 15
PSET (9, 15), 15
PSET (10, 15), 15
PSET (7, 15), 15
PSET (6, 15), 15
PSET (7, 14), 15
PSET (8, 14), 15
PSET (9, 14), 15
PSET (9, 13), 15
PSET (8, 13), 15
PSET (7, 13), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (9, 11), 15
PSET (10, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (6, 11), 15
PSET (6, 10), 15
PSET (7, 10), 15
PSET (9, 10), 15
PSET (10, 10), 15
PSET (10, 9), 15
PSET (11, 9), 15
PSET (4, 9), 15
PSET (5, 9), 15
PSET (6, 9), 15
PSET (9, 8), 88
PSET (8, 8), 88
PSET (7, 8), 88
PSET (7, 7), 88
PSET (6, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 7), 88
PSET (10, 6), 88
PSET (11, 6), 88
PSET (9, 6), 88
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 6), 88
PSET (5, 5), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 5), 88
PSET (4, 5), 88
PSET (5, 5), 114
PSET (4, 5), 16
PSET (4, 5), 114
PSET (5, 4), 114
PSET (5, 3), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114
PSET (11, 3), 114
PSET (11, 4), 114
PSET (11, 5), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (6, 2), 114
PSET (7, 2), 114
PSET (8, 2), 114
PSET (9, 2), 114
PSET (10, 2), 114
PSET (9, 6), 16
PSET (7, 6), 16
PSET (4, 5), 16
GET (1, 1)-(15, 15), wmagedown

LINE (1, 1)-(15, 15), 0, BF
PSET (6, 1), 88
PSET (7, 1), 88
PSET (8, 1), 88
PSET (9, 1), 88
PSET (10, 1), 88
PSET (11, 2), 88
PSET (10, 2), 88
PSET (9, 2), 88
PSET (8, 2), 88
PSET (7, 2), 88
PSET (6, 2), 88
PSET (5, 2), 88
PSET (5, 3), 88
PSET (5, 4), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 4), 88
PSET (11, 3), 88
PSET (10, 3), 88
PSET (10, 4), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (8, 3), 88
PSET (6, 3), 88
PSET (6, 4), 88
PSET (7, 4), 88
PSET (7, 6), 88
PSET (8, 6), 88
PSET (9, 6), 88
PSET (9, 1), 114
PSET (10, 1), 114
PSET (9, 1), 114
PSET (8, 1), 114
PSET (7, 1), 114
PSET (6, 1), 114
PSET (5, 2), 114
PSET (5, 3), 114
PSET (11, 3), 114
PSET (11, 2), 114
PSET (9, 6), 4
PSET (9, 6), 88
PSET (9, 7), 4
PSET (8, 7), 4
PSET (7, 7), 4
PSET (6, 7), 4
PSET (10, 7), 4
PSET (10, 8), 4
PSET (11, 8), 4
PSET (12, 8), 4
PSET (11, 9), 4
PSET (10, 9), 4
PSET (12, 9), 4
PSET (9, 9), 4
PSET (8, 9), 4
PSET (7, 9), 4
PSET (6, 9), 4
PSET (5, 9), 4
PSET (4, 9), 4
PSET (4, 8), 4
PSET (5, 8), 4
PSET (6, 8), 4
PSET (7, 8), 4
PSET (8, 8), 4
PSET (9, 8), 4
PSET (9, 10), 4
PSET (10, 10), 4
PSET (10, 11), 4
PSET (9, 11), 4
PSET (8, 11), 4
PSET (7, 11), 4
PSET (6, 11), 4
PSET (6, 10), 4
PSET (7, 10), 4
PSET (8, 10), 4
PSET (10, 7), 1
PSET (11, 7), 1
PSET (11, 8), 1
PSET (12, 8), 1
PSET (12, 9), 1
PSET (10, 7), 1
PSET (9, 7), 1
PSET (10, 8), 1
PSET (8, 8), 1
PSET (7, 9), 1
PSET (6, 9), 1
PSET (6, 10), 1
PSET (10, 7), 14
PSET (11, 7), 14
PSET (11, 8), 14
PSET (10, 8), 14
PSET (12, 8), 14
PSET (4, 8), 14
PSET (5, 8), 14
PSET (5, 7), 14
PSET (6, 7), 14
PSET (6, 8), 14
PSET (6, 9), 4
PSET (12, 9), 4
PSET (12, 10), 4
PSET (13, 10), 4
PSET (13, 9), 4
PSET (3, 9), 4
PSET (3, 10), 4
PSET (4, 10), 4
PSET (6, 11), 1
PSET (7, 11), 1
PSET (8, 11), 1
PSET (9, 11), 1
PSET (10, 11), 1
PSET (14, 8), 14
PSET (13, 8), 14
PSET (4, 8), 14
PSET (3, 8), 14
PSET (4, 7), 14
PSET (13, 7), 14
PSET (12, 7), 14
PSET (13, 7), 16
PSET (14, 8), 16
PSET (13, 11), 88
PSET (12, 11), 88
PSET (4, 11), 88
PSET (3, 11), 88
PSET (7, 11), 4
PSET (7, 12), 4
PSET (8, 12), 4
PSET (9, 12), 4
PSET (10, 12), 4
PSET (6, 12), 4
PSET (6, 13), 4
PSET (7, 13), 4
PSET (9, 13), 4
PSET (10, 13), 4
PSET (10, 14), 4
PSET (9, 14), 4
PSET (7, 14), 4
PSET (6, 14), 4
PSET (7, 11), 1
PSET (6, 15), 16
PSET (6, 15), 1
PSET (7, 15), 1
PSET (9, 15), 1
PSET (10, 15), 1
PSET (9, 3), 16
PSET (7, 3), 16


GET (1, 1)-(15, 15), playerdown


LINE (1, 1)-(15, 15), 0, BF
PSET (6, 15), 1
PSET (7, 15), 1
PSET (9, 15), 1
PSET (10, 15), 1
PSET (10, 14), 40
PSET (9, 14), 40
PSET (7, 14), 40
PSET (6, 14), 40
PSET (6, 13), 40
PSET (7, 13), 40
PSET (8, 13), 40
PSET (9, 13), 40
PSET (10, 13), 40
PSET (9, 12), 40
PSET (8, 12), 40
PSET (7, 12), 40
PSET (7, 11), 1
PSET (8, 11), 1
PSET (9, 11), 1
PSET (9, 10), 40
PSET (8, 10), 40
PSET (7, 10), 40
PSET (7, 9), 40
PSET (8, 9), 40
PSET (9, 9), 40
PSET (10, 9), 40
PSET (11, 9), 40
PSET (12, 9), 40
PSET (12, 10), 40
PSET (11, 10), 40
PSET (11, 11), 88
PSET (12, 11), 88
PSET (5, 11), 88
PSET (4, 11), 88
PSET (4, 10), 40
PSET (5, 10), 40
PSET (5, 9), 40
PSET (4, 9), 40
PSET (6, 9), 40
PSET (4, 8), 14
PSET (5, 8), 14
PSET (6, 8), 14
PSET (10, 8), 14
PSET (12, 8), 14
PSET (11, 8), 14
PSET (9, 8), 40
PSET (8, 8), 40
PSET (7, 8), 40
PSET (7, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 6), 114
PSET (9, 6), 114
PSET (8, 6), 114
PSET (7, 6), 114
PSET (6, 6), 114
PSET (5, 5), 114
PSET (6, 5), 114
PSET (7, 5), 114
PSET (8, 5), 114
PSET (9, 5), 114
PSET (10, 5), 114
PSET (11, 5), 114
PSET (11, 4), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (5, 4), 114
PSET (5, 3), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114
PSET (11, 3), 114
PSET (10, 2), 114
PSET (9, 2), 114
PSET (8, 2), 114
PSET (7, 2), 114
PSET (6, 2), 114

GET (1, 1)-(15, 15), playerup


LINE (1, 1)-(15, 15), 0, BF
PSET (7, 1), 114
PSET (8, 1), 114
PSET (9, 1), 114
PSET (10, 1), 114
PSET (11, 1), 114
PSET (12, 2), 114
PSET (12, 3), 114
PSET (11, 3), 88
PSET (11, 2), 88
PSET (10, 2), 88
PSET (9, 2), 88
PSET (8, 2), 88
PSET (7, 2), 88
PSET (7, 3), 88
PSET (7, 4), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 5), 88
PSET (11, 4), 88
PSET (12, 4), 88
PSET (10, 4), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (8, 3), 88
PSET (9, 3), 88
PSET (10, 3), 88
PSET (6, 3), 88
PSET (6, 4), 88
PSET (5, 4), 88
PSET (5, 4), 16
PSET (6, 3), 16
PSET (8, 2), 16
PSET (8, 3), 16
PSET (8, 2), 88
PSET (10, 5), 88
PSET (10, 6), 88
PSET (9, 6), 88
PSET (8, 6), 88
PSET (8, 7), 14
PSET (9, 7), 14
PSET (10, 7), 14
PSET (10, 8), 14
PSET (9, 8), 14
PSET (8, 8), 14
PSET (8, 9), 14
PSET (7, 8), 14
PSET (11, 8), 14
PSET (9, 8), 16
PSET (10, 8), 16
PSET (8, 8), 16
PSET (8, 9), 16
PSET (8, 8), 40
PSET (9, 8), 40
PSET (10, 8), 40
PSET (10, 9), 40
PSET (9, 9), 40
PSET (8, 9), 40
PSET (8, 9), 1
PSET (9, 9), 1
PSET (10, 9), 1
PSET (10, 10), 40
PSET (9, 10), 40
PSET (8, 10), 40
PSET (8, 11), 40
PSET (9, 11), 40
PSET (10, 11), 40
PSET (9, 12), 88
PSET (8, 12), 88
PSET (10, 12), 1
PSET (10, 13), 40
PSET (9, 13), 40
PSET (8, 13), 40
PSET (8, 14), 40
PSET (9, 14), 40
PSET (10, 14), 40
PSET (10, 15), 1
PSET (9, 15), 1
PSET (8, 15), 1
PSET (7, 15), 1
PSET (7, 13), 40
PSET (7, 12), 40
PSET (7, 11), 40
PSET (7, 10), 40
PSET (7, 9), 40
PSET (11, 9), 40
PSET (11, 10), 40
PSET (11, 11), 40

GET (1, 1)-(15, 15), playerleft

LINE (1, 1)-(15, 15), 0, BF
PSET (6, 15), 1
PSET (7, 15), 1
PSET (8, 15), 1
PSET (9, 15), 1
PSET (8, 14), 40
PSET (7, 14), 40
PSET (6, 14), 40
PSET (6, 13), 40
PSET (7, 13), 40
PSET (8, 13), 40
PSET (9, 13), 40
PSET (9, 12), 40
PSET (8, 12), 88
PSET (7, 12), 88
PSET (6, 12), 40
PSET (5, 11), 40
PSET (6, 11), 40
PSET (7, 11), 40
PSET (8, 11), 40
PSET (9, 11), 40
PSET (9, 10), 40
PSET (8, 10), 40
PSET (7, 10), 40
PSET (6, 10), 40
PSET (5, 10), 40
PSET (5, 9), 40
PSET (6, 9), 1
PSET (7, 9), 1
PSET (8, 9), 1
PSET (9, 9), 40
PSET (9, 8), 14
PSET (8, 8), 40
PSET (7, 8), 40
PSET (6, 8), 40
PSET (5, 8), 14
PSET (6, 7), 14
PSET (7, 7), 14
PSET (8, 7), 14
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 5), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (7, 4), 88
PSET (6, 4), 88
PSET (5, 4), 88
PSET (4, 4), 88
PSET (4, 3), 114
PSET (4, 2), 114
PSET (5, 1), 114
PSET (6, 1), 114
PSET (7, 1), 114
PSET (8, 1), 114
PSET (9, 1), 114
PSET (8, 2), 88
PSET (7, 2), 88
PSET (6, 2), 88
PSET (5, 2), 88
PSET (5, 3), 88
PSET (6, 3), 88
PSET (7, 3), 88
PSET (8, 3), 88
PSET (9, 3), 88
PSET (9, 2), 88
PSET (10, 4), 88
PSET (8, 3), 16


GET (1, 1)-(15, 15), playerright



LINE (1, 1)-(15, 15), 255, BF
PSET (6, 1), 88
PSET (7, 1), 88
PSET (8, 1), 88
PSET (9, 1), 88
PSET (10, 1), 88
PSET (11, 2), 88
PSET (10, 2), 88
PSET (9, 2), 88
PSET (8, 2), 88
PSET (7, 2), 88
PSET (6, 2), 88
PSET (5, 2), 88
PSET (5, 3), 88
PSET (5, 4), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 4), 88
PSET (11, 3), 88
PSET (10, 3), 88
PSET (10, 4), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (8, 3), 88
PSET (6, 3), 88
PSET (6, 4), 88
PSET (7, 4), 88
PSET (7, 6), 88
PSET (8, 6), 88
PSET (9, 6), 88
PSET (9, 1), 114
PSET (10, 1), 114
PSET (9, 1), 114
PSET (8, 1), 114
PSET (7, 1), 114
PSET (6, 1), 114
PSET (5, 2), 114
PSET (5, 3), 114
PSET (11, 3), 114
PSET (11, 2), 114
PSET (9, 6), 4
PSET (9, 6), 88
PSET (9, 7), 4
PSET (8, 7), 4
PSET (7, 7), 4
PSET (6, 7), 4
PSET (10, 7), 4
PSET (10, 8), 4
PSET (11, 8), 4
PSET (12, 8), 4
PSET (11, 9), 4
PSET (10, 9), 4
PSET (12, 9), 4
PSET (9, 9), 4
PSET (8, 9), 4
PSET (7, 9), 4
PSET (6, 9), 4
PSET (5, 9), 4
PSET (4, 9), 4
PSET (4, 8), 4
PSET (5, 8), 4
PSET (6, 8), 4
PSET (7, 8), 4
PSET (8, 8), 4
PSET (9, 8), 4
PSET (9, 10), 4
PSET (10, 10), 4
PSET (10, 11), 4
PSET (9, 11), 4
PSET (8, 11), 4
PSET (7, 11), 4
PSET (6, 11), 4
PSET (6, 10), 4
PSET (7, 10), 4
PSET (8, 10), 4
PSET (10, 7), 1
PSET (11, 7), 1
PSET (11, 8), 1
PSET (12, 8), 1
PSET (12, 9), 1
PSET (10, 7), 1
PSET (9, 7), 1
PSET (10, 8), 1
PSET (8, 8), 1
PSET (7, 9), 1
PSET (6, 9), 1
PSET (6, 10), 1
PSET (10, 7), 14
PSET (11, 7), 14
PSET (11, 8), 14
PSET (10, 8), 14
PSET (12, 8), 14
PSET (4, 8), 14
PSET (5, 8), 14
PSET (5, 7), 14
PSET (6, 7), 14
PSET (6, 8), 14
PSET (6, 9), 4
PSET (12, 9), 4
PSET (12, 10), 4
PSET (13, 10), 4
PSET (13, 9), 4
PSET (3, 9), 4
PSET (3, 10), 4
PSET (4, 10), 4
PSET (6, 11), 1
PSET (7, 11), 1
PSET (8, 11), 1
PSET (9, 11), 1
PSET (10, 11), 1
PSET (14, 8), 14
PSET (13, 8), 14
PSET (4, 8), 14
PSET (3, 8), 14
PSET (4, 7), 14
PSET (13, 7), 14
PSET (12, 7), 14
PSET (13, 7), 16
PSET (14, 8), 16
PSET (13, 11), 88
PSET (12, 11), 88
PSET (4, 11), 88
PSET (3, 11), 88
PSET (7, 11), 4
PSET (7, 12), 4
PSET (8, 12), 4
PSET (9, 12), 4
PSET (10, 12), 4
PSET (6, 12), 4
PSET (6, 13), 4
PSET (7, 13), 4
PSET (9, 13), 4
PSET (10, 13), 4
PSET (10, 14), 4
PSET (9, 14), 4
PSET (7, 14), 4
PSET (6, 14), 4
PSET (7, 11), 1
PSET (6, 15), 16
PSET (6, 15), 1
PSET (7, 15), 1
PSET (9, 15), 1
PSET (10, 15), 1
PSET (9, 3), 16
PSET (7, 3), 16


GET (1, 1)-(15, 15), playerdownmask


LINE (1, 1)-(15, 15), 255, BF
PSET (6, 15), 1
PSET (7, 15), 1
PSET (9, 15), 1
PSET (10, 15), 1
PSET (10, 14), 40
PSET (9, 14), 40
PSET (7, 14), 40
PSET (6, 14), 40
PSET (6, 13), 40
PSET (7, 13), 40
PSET (8, 13), 40
PSET (9, 13), 40
PSET (10, 13), 40
PSET (9, 12), 40
PSET (8, 12), 40
PSET (7, 12), 40
PSET (7, 11), 1
PSET (8, 11), 1
PSET (9, 11), 1
PSET (9, 10), 40
PSET (8, 10), 40
PSET (7, 10), 40
PSET (7, 9), 40
PSET (8, 9), 40
PSET (9, 9), 40
PSET (10, 9), 40
PSET (11, 9), 40
PSET (12, 9), 40
PSET (12, 10), 40
PSET (11, 10), 40
PSET (11, 11), 88
PSET (12, 11), 88
PSET (5, 11), 88
PSET (4, 11), 88
PSET (4, 10), 40
PSET (5, 10), 40
PSET (5, 9), 40
PSET (4, 9), 40
PSET (6, 9), 40
PSET (4, 8), 14
PSET (5, 8), 14
PSET (6, 8), 14
PSET (10, 8), 14
PSET (12, 8), 14
PSET (11, 8), 14
PSET (9, 8), 40
PSET (8, 8), 40
PSET (7, 8), 40
PSET (7, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 6), 114
PSET (9, 6), 114
PSET (8, 6), 114
PSET (7, 6), 114
PSET (6, 6), 114
PSET (5, 5), 114
PSET (6, 5), 114
PSET (7, 5), 114
PSET (8, 5), 114
PSET (9, 5), 114
PSET (10, 5), 114
PSET (11, 5), 114
PSET (11, 4), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (5, 4), 114
PSET (5, 3), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114
PSET (11, 3), 114
PSET (10, 2), 114
PSET (9, 2), 114
PSET (8, 2), 114
PSET (7, 2), 114
PSET (6, 2), 114

GET (1, 1)-(15, 15), playerupmask


LINE (1, 1)-(15, 15), 255, BF
PSET (7, 1), 114
PSET (8, 1), 114
PSET (9, 1), 114
PSET (10, 1), 114
PSET (11, 1), 114
PSET (12, 2), 114
PSET (12, 3), 114
PSET (11, 3), 88
PSET (11, 2), 88
PSET (10, 2), 88
PSET (9, 2), 88
PSET (8, 2), 88
PSET (7, 2), 88
PSET (7, 3), 88
PSET (7, 4), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 5), 88
PSET (11, 4), 88
PSET (12, 4), 88
PSET (10, 4), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (8, 3), 88
PSET (9, 3), 88
PSET (10, 3), 88
PSET (6, 3), 88
PSET (6, 4), 88
PSET (5, 4), 88
PSET (5, 4), 16
PSET (6, 3), 16
PSET (8, 2), 16
PSET (8, 3), 16
PSET (8, 2), 88
PSET (10, 5), 88
PSET (10, 6), 88
PSET (9, 6), 88
PSET (8, 6), 88
PSET (8, 7), 14
PSET (9, 7), 14
PSET (10, 7), 14
PSET (10, 8), 14
PSET (9, 8), 14
PSET (8, 8), 14
PSET (8, 9), 14
PSET (7, 8), 14
PSET (11, 8), 14
PSET (9, 8), 16
PSET (10, 8), 16
PSET (8, 8), 16
PSET (8, 9), 16
PSET (8, 8), 40
PSET (9, 8), 40
PSET (10, 8), 40
PSET (10, 9), 40
PSET (9, 9), 40
PSET (8, 9), 40
PSET (8, 9), 1
PSET (9, 9), 1
PSET (10, 9), 1
PSET (10, 10), 40
PSET (9, 10), 40
PSET (8, 10), 40
PSET (8, 11), 40
PSET (9, 11), 40
PSET (10, 11), 40
PSET (9, 12), 88
PSET (8, 12), 88
PSET (10, 12), 1
PSET (10, 13), 40
PSET (9, 13), 40
PSET (8, 13), 40
PSET (8, 14), 40
PSET (9, 14), 40
PSET (10, 14), 40
PSET (10, 15), 1
PSET (9, 15), 1
PSET (8, 15), 1
PSET (7, 15), 1
PSET (7, 13), 40
PSET (7, 12), 40
PSET (7, 11), 40
PSET (7, 10), 40
PSET (7, 9), 40
PSET (11, 9), 40
PSET (11, 10), 40
PSET (11, 11), 40

GET (1, 1)-(15, 15), playerleftmask

LINE (1, 1)-(15, 15), 255, BF
PSET (6, 15), 1
PSET (7, 15), 1
PSET (8, 15), 1
PSET (9, 15), 1
PSET (8, 14), 40
PSET (7, 14), 40
PSET (6, 14), 40
PSET (6, 13), 40
PSET (7, 13), 40
PSET (8, 13), 40
PSET (9, 13), 40
PSET (9, 12), 40
PSET (8, 12), 88
PSET (7, 12), 88
PSET (6, 12), 40
PSET (5, 11), 40
PSET (6, 11), 40
PSET (7, 11), 40
PSET (8, 11), 40
PSET (9, 11), 40
PSET (9, 10), 40
PSET (8, 10), 40
PSET (7, 10), 40
PSET (6, 10), 40
PSET (5, 10), 40
PSET (5, 9), 40
PSET (6, 9), 1
PSET (7, 9), 1
PSET (8, 9), 1
PSET (9, 9), 40
PSET (9, 8), 14
PSET (8, 8), 40
PSET (7, 8), 40
PSET (6, 8), 40
PSET (5, 8), 14
PSET (6, 7), 14
PSET (7, 7), 14
PSET (8, 7), 14
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 5), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (9, 4), 88
PSET (8, 4), 88
PSET (7, 4), 88
PSET (6, 4), 88
PSET (5, 4), 88
PSET (4, 4), 88
PSET (4, 3), 114
PSET (4, 2), 114
PSET (5, 1), 114
PSET (6, 1), 114
PSET (7, 1), 114
PSET (8, 1), 114
PSET (9, 1), 114
PSET (8, 2), 88
PSET (7, 2), 88
PSET (6, 2), 88
PSET (5, 2), 88
PSET (5, 3), 88
PSET (6, 3), 88
PSET (7, 3), 88
PSET (8, 3), 88
PSET (9, 3), 88
PSET (9, 2), 88
PSET (10, 4), 88
PSET (8, 3), 16


GET (1, 1)-(15, 15), playerrightmask

LINE (1, 1)-(15, 15), 255, BF
PSET (5, 15), 15
PSET (6, 14), 15
PSET (6, 13), 15
PSET (6, 12), 15
PSET (4, 13), 15
PSET (5, 12), 15
PSET (3, 12), 15
PSET (3, 11), 15
PSET (3, 10), 15
PSET (4, 9), 15
PSET (5, 10), 15
PSET (5, 11), 15
PSET (4, 12), 88
PSET (4, 11), 88
PSET (4, 10), 9
PSET (11, 15), 15
PSET (10, 14), 15
PSET (10, 13), 15
PSET (10, 12), 15
PSET (11, 12), 15
PSET (12, 13), 15
PSET (13, 12), 15
PSET (13, 11), 15
PSET (13, 10), 15
PSET (12, 9), 15
PSET (11, 10), 15
PSET (11, 11), 15
PSET (12, 12), 88
PSET (12, 11), 88
PSET (12, 10), 9
PSET (9, 9), 9
PSET (8, 9), 9
PSET (7, 9), 9
PSET (8, 10), 9
PSET (8, 15), 15
PSET (9, 15), 15
PSET (10, 15), 15
PSET (7, 15), 15
PSET (6, 15), 15
PSET (7, 14), 15
PSET (8, 14), 15
PSET (9, 14), 15
PSET (9, 13), 15
PSET (8, 13), 15
PSET (7, 13), 15
PSET (7, 12), 15
PSET (8, 12), 15
PSET (9, 12), 15
PSET (9, 11), 15
PSET (10, 11), 15
PSET (8, 11), 15
PSET (7, 11), 15
PSET (6, 11), 15
PSET (6, 10), 15
PSET (7, 10), 15
PSET (9, 10), 15
PSET (10, 10), 15
PSET (10, 9), 15
PSET (11, 9), 15
PSET (4, 9), 15
PSET (5, 9), 15
PSET (6, 9), 15
PSET (9, 8), 88
PSET (8, 8), 88
PSET (7, 8), 88
PSET (7, 7), 88
PSET (6, 7), 88
PSET (8, 7), 88
PSET (9, 7), 88
PSET (10, 7), 88
PSET (10, 6), 88
PSET (11, 6), 88
PSET (9, 6), 88
PSET (8, 6), 88
PSET (7, 6), 88
PSET (6, 6), 88
PSET (5, 6), 88
PSET (5, 5), 88
PSET (6, 5), 88
PSET (7, 5), 88
PSET (8, 5), 88
PSET (9, 5), 88
PSET (10, 5), 88
PSET (11, 5), 88
PSET (4, 5), 88
PSET (5, 5), 114
PSET (4, 5), 16
PSET (4, 5), 114
PSET (5, 4), 114
PSET (5, 3), 114
PSET (6, 3), 114
PSET (7, 3), 114
PSET (8, 3), 114
PSET (9, 3), 114
PSET (10, 3), 114
PSET (11, 3), 114
PSET (11, 4), 114
PSET (11, 5), 114
PSET (10, 4), 114
PSET (9, 4), 114
PSET (8, 4), 114
PSET (7, 4), 114
PSET (6, 4), 114
PSET (6, 2), 114
PSET (7, 2), 114
PSET (8, 2), 114
PSET (9, 2), 114
PSET (10, 2), 114
PSET (9, 6), 16
PSET (7, 6), 16
PSET (4, 5), 16
GET (1, 1)-(15, 15), wmagedownmask

LINE (1, 15)-(15, 15), 17, BF
LINE (1, 1)-(15, 1), 17, BF
LINE (1, 1)-(1, 15), 17, BF
LINE (15, 1)-(15, 15), 17, BF

LINE (2, 14)-(2, 14), 8, BF
LINE (3, 14)-(3, 14), 16, BF
LINE (4, 14)-(10, 14), 8, BF
LINE (11, 14)-(11, 14), 17, BF
LINE (12, 14)-(14, 14), 8, BF

LINE (2, 13)-(2, 13), 23, BF
LINE (3, 13)-(3, 13), 17, BF
LINE (4, 13)-(10, 13), 23, BF
LINE (11, 13)-(11, 13), 17, BF
LINE (12, 13)-(14, 13), 23, BF

LINE (2, 14)-(2, 14), 21, BF
LINE (3, 14)-(3, 14), 16, BF
LINE (4, 14)-(10, 14), 21, BF
LINE (11, 14)-(11, 14), 17, BF
LINE (12, 14)-(14, 14), 21, BF

LINE (1, 12)-(15, 12), 17, BF

LINE (2, 11)-(7, 11), 21, BF
LINE (8, 11)-(8, 11), 17, BF
LINE (9, 11)-(14, 11), 21, BF

LINE (2, 10)-(7, 10), 21, BF
LINE (8, 10)-(8, 10), 17, BF
LINE (9, 10)-(14, 10), 21, BF

LINE (2, 9)-(7, 9), 23, BF
LINE (8, 9)-(8, 9), 17, BF
LINE (9, 9)-(14, 9), 23, BF

LINE (1, 8)-(15, 8), 17, BF
LINE (2, 2)-(14, 7), 21, BF

LINE (1, 1)-(1, 1), 120, BF
LINE (15, 1)-(15, 1), 120, BF
LINE (1, 8)-(1, 8), 23, BF
LINE (15, 8)-(15, 8), 23, BF
LINE (1, 15)-(1, 15), 120, BF

GET (1, 1)-(15, 15), wall


LINE (1, 1)-(15, 15), 120, BF
LINE (2, 2)-(2, 2), 16, BF
LINE (9, 3)-(9, 3), 16, BF
LINE (6, 11)-(6, 11), 16, BF
LINE (12, 13)-(12, 13), 16, BF
GET (1, 1)-(15, 15), grass


LINE (1, 1)-(15, 15), 53, BF
LINE (2, 2)-(2, 2), 15, BF
LINE (10, 2)-(10, 2), 15, BF
LINE (2, 14)-(2, 14), 15, BF
LINE (2, 14)-(2, 14), 15, BF
LINE (7, 5)-(7, 5), 15, BF
LINE (13, 9)-(13, 9), 15, BF
LINE (7, 12)-(7, 12), 15, BF
GET (1, 1)-(15, 15), water

LINE (1, 1)-(15, 15), 120, BF
CIRCLE (6, 5), 4, 16
CIRCLE (9, 4), 4, 16
CIRCLE (8, 7), 4, 16
CIRCLE (6, 7), 4, 16
CIRCLE (9, 8), 4, 16
LINE (6, 11)-(7, 11), 115
LINE (5, 12)-(8, 12), 115
LINE (5, 13)-(9, 13), 115
LINE (8, 2)-(10, 2), 217
LINE (5, 3)-(12, 3), 217
LINE (3, 4)-(13, 4), 217
LINE (3, 5)-(12, 5), 217
LINE (3, 6)-(12, 6), 217
LINE (3, 7)-(12, 8), 217, BF
LINE (4, 9)-(12, 9), 217
LINE (7, 10)-(10, 10), 217
PSET (3, 11), 16
PSET (13, 14), 16

GET (1, 1)-(15, 15), tree



LINE (1, 1)-(15, 15), 3, BF
LINE (1, 15)-(15, 15), 17, BF
LINE (1, 13)-(1, 14), 17
PSET (4, 14), 17
LINE (2, 14)-(3, 14), 23, BF
PSET (10, 14), 17
LINE (5, 14)-(9, 14), 23, BF
LINE (11, 14)-(14, 14), 23, BF
LINE (15, 13)-(15, 14), 17
PSET (5, 13), 17
LINE (2, 13)-(4, 13), 26
LINE (6, 13)-(11, 13), 26
PSET (12, 13), 17
LINE (13, 13)-(14, 13), 26
LINE (1, 12)-(14, 12), 17
PSET (15, 12), 26
PSET (1, 11), 26
PSET (2, 11), 17
LINE (3, 11)-(8, 11), 23
PSET (9, 11), 17
LINE (10, 11)-(14, 11), 23
PSET (15, 11), 17


LINE (1, 10)-(15, 10), 17, BF
LINE (1, 8)-(1, 9), 17
PSET (4, 9), 17
LINE (2, 9)-(3, 9), 23, BF
PSET (10, 9), 17
LINE (5, 9)-(9, 9), 23, BF
LINE (11, 9)-(14, 9), 23, BF
LINE (15, 8)-(15, 9), 17
PSET (5, 8), 17
LINE (2, 8)-(4, 8), 26
LINE (6, 8)-(11, 8), 26
PSET (12, 8), 17
LINE (13, 8)-(14, 8), 26
LINE (1, 7)-(14, 7), 17
PSET (15, 7), 26
PSET (1, 6), 26
PSET (2, 6), 17
LINE (3, 6)-(8, 6), 23
PSET (9, 6), 17
LINE (10, 6)-(14, 6), 23
PSET (15, 6), 17

LINE (1, 5)-(15, 5), 17, BF
LINE (1, 3)-(1, 4), 17
PSET (4, 4), 17
LINE (2, 4)-(3, 4), 23, BF
PSET (10, 4), 17
LINE (5, 4)-(9, 4), 23, BF
LINE (11, 4)-(14, 4), 23, BF
LINE (15, 3)-(15, 4), 17
PSET (5, 3), 17
LINE (2, 3)-(4, 3), 26
LINE (6, 3)-(11, 3), 26
PSET (12, 3), 17
LINE (13, 3)-(14, 3), 26
LINE (1, 2)-(14, 2), 17
PSET (15, 2), 26
PSET (1, 1), 26
PSET (2, 1), 17
LINE (3, 1)-(8, 1), 23
PSET (9, 1), 17
LINE (10, 1)-(14, 1), 23
PSET (15, 1), 17
GET (1, 1)-(15, 15), stones

LINE (1, 1)-(15, 15), 15, BF
LINE (1, 1)-(15, 1), 7, BF
LINE (2, 11)-(6, 11), 7, BF
LINE (9, 11)-(13, 11), 7, BF
LINE (3, 6)-(5, 6), 7, BF
LINE (10, 6)-(12, 6), 7, BF
LINE (2, 7)-(2, 11), 7, BF
LINE (6, 7)-(6, 11), 7, BF
LINE (9, 7)-(9, 11), 7, BF
LINE (13, 7)-(13, 11), 7, BF
LINE (3, 7)-(5, 10), 21, BF
LINE (10, 7)-(12, 10), 21, BF
GET (1, 1)-(15, 15), windows


LINE (1, 1)-(15, 15), 3, BF
PSET (1, 15), 19
LINE (2, 15)-(7, 15), 15, BF
LINE (8, 15)-(8, 15), 19
LINE (9, 15)-(14, 15), 15, BF
PSET (15, 15), 19

PSET (1, 14), 15
LINE (2, 14)-(7, 14), 7, BF
PSET (8, 14), 15
LINE (9, 14)-(14, 14), 7, BF
PSET (15, 14), 23

PSET (1, 13), 15
LINE (2, 13)-(7, 13), 7, BF
PSET (8, 13), 15
LINE (9, 13)-(14, 13), 7, BF
PSET (15, 13), 23

PSET (1, 12), 15
LINE (2, 12)-(7, 12), 7, BF
PSET (8, 12), 15
LINE (9, 12)-(14, 12), 7, BF
PSET (15, 12), 23

PSET (1, 12), 15
LINE (2, 12)-(7, 12), 7, BF
PSET (8, 12), 15
LINE (9, 12)-(14, 12), 7, BF
PSET (15, 12), 23

PSET (1, 11), 15
LINE (2, 11)-(7, 11), 7, BF
PSET (8, 11), 15
LINE (9, 11)-(14, 11), 7, BF
PSET (15, 11), 23

PSET (1, 10), 15
LINE (2, 10)-(7, 10), 7, BF
PSET (8, 10), 15
LINE (9, 10)-(14, 10), 7, BF
PSET (15, 10), 23

PSET (1, 9), 19
LINE (2, 9)-(7, 9), 15, BF
LINE (8, 9)-(8, 9), 19
LINE (9, 9)-(14, 9), 15, BF
PSET (15, 9), 19

PSET (1, 8), 15
LINE (2, 8)-(7, 8), 7, BF
PSET (8, 8), 15
LINE (9, 8)-(14, 8), 7, BF
PSET (15, 8), 23

PSET (1, 7), 15
LINE (2, 7)-(7, 7), 7, BF
PSET (8, 7), 15
LINE (9, 7)-(14, 7), 7, BF
PSET (15, 7), 23

PSET (1, 6), 15
LINE (2, 6)-(7, 6), 7, BF
PSET (8, 6), 15
LINE (9, 6)-(14, 6), 7, BF
PSET (15, 6), 23

PSET (1, 5), 15
LINE (2, 5)-(7, 5), 7, BF
PSET (8, 5), 15
LINE (9, 5)-(14, 5), 7, BF
PSET (15, 5), 23

PSET (1, 4), 15
LINE (2, 4)-(7, 4), 7, BF
PSET (8, 4), 15
LINE (9, 4)-(14, 4), 7, BF
PSET (15, 4), 23

PSET (1, 3), 15
LINE (2, 3)-(7, 3), 7, BF
PSET (8, 3), 15
LINE (9, 3)-(14, 3), 7, BF
PSET (15, 3), 23

LINE (1, 3)-(15, 3), 15
LINE (1, 2)-(15, 2), 23
LINE (1, 1)-(15, 1), 120
GET (1, 1)-(15, 15), tiles


LINE (1, 1)-(15, 15), 15, BF
LINE (1, 5)-(1, 15), 16, BF
LINE (2, 5)-(2, 15), 7, BF
LINE (3, 5)-(3, 15), 16, BF

LINE (13, 5)-(13, 15), 16, BF
LINE (14, 5)-(14, 15), 7, BF
LINE (15, 5)-(15, 15), 16, BF

LINE (7, 3)-(7, 15), 16, BF
LINE (8, 3)-(8, 15), 7, BF
LINE (9, 3)-(9, 15), 16, BF

LINE (4, 10)-(6, 10), 16, BF
LINE (4, 11)-(6, 11), 15, BF
LINE (4, 12)-(6, 12), 16, BF

LINE (10, 10)-(12, 10), 16, BF
LINE (10, 11)-(12, 11), 15, BF
LINE (10, 12)-(12, 12), 16, BF

PSET (7, 2), 16: PSET (8, 2), 7: PSET (9, 2), 16
PSET (6, 2), 16: PSET (5, 2), 7: PSET (4, 2), 16
PSET (5, 3), 16: PSET (4, 3), 7: PSET (3, 3), 16
PSET (4, 4), 16: PSET (3, 4), 7: PSET (2, 4), 16

LINE (5, 1)-(11, 1), 16
PSET (10, 2), 16: PSET (11, 2), 7: PSET (12, 2), 16
PSET (11, 3), 16: PSET (12, 3), 7: PSET (13, 3), 16
PSET (12, 4), 16: PSET (13, 4), 7: PSET (14, 4), 16
GET (1, 1)-(15, 15), door


LINE (1, 1)-(15, 15), 3, BF
LINE (1, 15)-(2, 15), 23
LINE (3, 15)-(13, 15), 16
LINE (14, 15)-(15, 15), 23

LINE (1, 14)-(3, 14), 23
LINE (4, 14)-(12, 14), 16
LINE (13, 14)-(15, 14), 23

LINE (1, 13)-(15, 13), 23
PSET (1, 12), 23
LINE (2, 12)-(3, 12), 16
LINE (4, 12)-(6, 12), 23
LINE (7, 12)-(9, 12), 16
LINE (10, 12)-(12, 12), 23
LINE (13, 12)-(14, 12), 16
PSET (15, 12), 23
LINE (1, 10)-(15, 10), 19
LINE (1, 11)-(15, 11), 15
LINE (1, 5)-(15, 9), 23, BF

LINE (1, 4)-(15, 4), 16

PSET (1, 3), 23
LINE (2, 3)-(3, 3), 16
LINE (4, 3)-(6, 3), 23
LINE (7, 3)-(9, 3), 16
LINE (10, 3)-(12, 3), 23
LINE (13, 3)-(14, 3), 16
PSET (15, 3), 23

LINE (1, 2)-(15, 2), 19
LINE (1, 1)-(15, 1), 15
GET (1, 1)-(15, 15), bridge


LINE (1, 1)-(15, 15), 15, BF
LINE (1, 15)-(15, 15), 16, BF
LINE (1, 1)-(15, 1), 16, BF
LINE (1, 6)-(15, 6), 16, BF
LINE (1, 11)-(15, 11), 16, BF
LINE (1, 2)-(1, 14), 16
LINE (8, 12)-(8, 14), 16
LINE (8, 2)-(8, 5), 16
LINE (15, 2)-(15, 14), 16
LINE (1, 1)-(15, 1), 16, BF
LINE (5, 7)-(5, 10), 16, BF
LINE (11, 7)-(11, 10), 16, BF
LINE (2, 14)-(7, 14), 19
LINE (2, 13)-(7, 13), 20
LINE (2, 12)-(7, 12), 21
LINE (9, 14)-(14, 14), 19
LINE (9, 13)-(14, 13), 20
LINE (9, 12)-(14, 12), 21
LINE (12, 10)-(14, 10), 22
LINE (12, 9)-(14, 9), 23
LINE (12, 8)-(14, 8), 24
LINE (12, 7)-(14, 7), 25
LINE (6, 10)-(10, 10), 22
LINE (6, 9)-(10, 9), 23
LINE (6, 8)-(10, 8), 24
LINE (6, 7)-(10, 7), 25
LINE (2, 10)-(4, 10), 22
LINE (2, 9)-(4, 9), 23
LINE (2, 8)-(4, 8), 24
LINE (2, 7)-(4, 7), 25
LINE (2, 5)-(7, 5), 26
LINE (2, 4)-(7, 4), 27
LINE (2, 3)-(7, 3), 28
LINE (2, 2)-(7, 2), 29
LINE (9, 5)-(14, 5), 26
LINE (9, 4)-(14, 4), 27
LINE (9, 3)-(14, 3), 28
LINE (9, 2)-(14, 2), 29
GET (1, 1)-(15, 15), castle

LINE (1, 1)-(15, 15), 15, BF
PSET (1, 15), 16
PSET (15, 15), 16
PSET (1, 1), 16
PSET (15, 1), 16
LINE (2, 15)-(14, 15), 29
LINE (1, 14)-(15, 14), 27
LINE (1, 13)-(15, 13), 25
LINE (2, 1)-(14, 1), 29
LINE (1, 2)-(15, 2), 27
LINE (1, 3)-(15, 3), 25
LINE (1, 3)-(1, 13), 29
LINE (2, 3)-(2, 13), 27
LINE (3, 3)-(3, 13), 25
LINE (15, 3)-(15, 13), 29
LINE (14, 3)-(14, 13), 27
LINE (13, 3)-(13, 13), 25
LINE (4, 4)-(12, 12), 54, BF
PSET (6, 6), 15
PSET (8, 4), 15
PSET (10, 11), 15
GET (1, 1)-(15, 15), fountain

LINE (1, 1)-(15, 15), 3, BF
LINE (1, 15)-(15, 15), 17, BF
LINE (1, 13)-(1, 14), 17
PSET (4, 14), 17
LINE (2, 14)-(3, 14), 23, BF
PSET (10, 14), 17
LINE (5, 14)-(9, 14), 23, BF
LINE (11, 14)-(14, 14), 23, BF
LINE (15, 13)-(15, 14), 17
PSET (5, 13), 17
LINE (2, 13)-(4, 13), 26
LINE (6, 13)-(11, 13), 26
PSET (12, 13), 17
LINE (13, 13)-(14, 13), 26
LINE (1, 12)-(14, 12), 17
PSET (15, 12), 26
PSET (1, 11), 26
PSET (2, 11), 17
LINE (3, 11)-(8, 11), 23
PSET (9, 11), 17
LINE (10, 11)-(14, 11), 23
PSET (15, 11), 17
LINE (1, 10)-(15, 10), 17, BF
LINE (1, 8)-(1, 9), 17
PSET (4, 9), 17
LINE (2, 9)-(3, 9), 23, BF
PSET (10, 9), 17
LINE (5, 9)-(9, 9), 23, BF
LINE (11, 9)-(14, 9), 23, BF
LINE (15, 8)-(15, 9), 17
PSET (5, 8), 17
LINE (2, 8)-(4, 8), 26
LINE (6, 8)-(11, 8), 26
PSET (12, 8), 17
LINE (13, 8)-(14, 8), 26
LINE (1, 7)-(14, 7), 17
PSET (15, 7), 26
PSET (1, 6), 26
PSET (2, 6), 17
LINE (3, 6)-(8, 6), 23
PSET (9, 6), 17
LINE (10, 6)-(14, 6), 23
PSET (15, 6), 17
LINE (1, 5)-(15, 5), 17, BF
LINE (1, 3)-(1, 4), 17
PSET (4, 4), 17
LINE (2, 4)-(3, 4), 23, BF
PSET (10, 4), 17
LINE (5, 4)-(9, 4), 23, BF
LINE (11, 4)-(14, 4), 23, BF
LINE (15, 3)-(15, 4), 17
PSET (5, 3), 17
LINE (2, 3)-(4, 3), 26
LINE (6, 3)-(11, 3), 26
PSET (12, 3), 17
LINE (13, 3)-(14, 3), 26
LINE (1, 2)-(14, 2), 17
PSET (15, 2), 26
PSET (1, 1), 26
PSET (2, 1), 17
LINE (3, 1)-(8, 1), 23
PSET (9, 1), 17
LINE (10, 1)-(14, 1), 23
PSET (15, 1), 17
LINE (5, 1)-(11, 1), 6, BF
LINE (4, 2)-(12, 2), 6, BF
LINE (4, 3)-(12, 6), 89, BF
LINE (5, 7)-(11, 7), 89, BF
LINE (4, 3)-(4, 5), 6
LINE (5, 3)-(5, 4), 6
PSET (6, 3), 6
LINE (12, 3)-(12, 5), 6
LINE (11, 3)-(11, 4), 6
PSET (10, 3), 6
PSET (7, 5), 16
PSET (9, 5), 16
LINE (7, 8)-(9, 8), 89, BF
PSET (8, 9), 89
LINE (6, 9)-(7, 9), 6
LINE (9, 9)-(10, 9), 6
LINE (5, 10)-(11, 13), 6, BF
LINE (6, 14)-(10, 14), 6
LINE (5, 15)-(7, 15), 19
LINE (9, 15)-(11, 15), 19
LINE (4, 9)-(5, 9), 89
LINE (3, 10)-(4, 11), 89, BF
PSET (3, 12), 89
LINE (11, 9)-(12, 9), 89
LINE (12, 10)-(13, 11), 89, BF
PSET (13, 12), 89
LINE (5, 12)-(11, 12), 117
PSET (8, 12), 14
GET (1, 1)-(15, 15), clerk

LINE (1, 1)-(15, 15), 120, BF
LINE (2, 2)-(2, 2), 16, BF
LINE (9, 3)-(9, 3), 16, BF
LINE (6, 11)-(6, 11), 16, BF
LINE (12, 13)-(12, 13), 16, BF
LINE (5, 1)-(11, 1), 6, BF
LINE (4, 2)-(12, 2), 6, BF
LINE (4, 3)-(12, 6), 89, BF
LINE (5, 7)-(11, 7), 89, BF
LINE (4, 3)-(4, 5), 6
LINE (5, 3)-(5, 4), 6
PSET (6, 3), 6
LINE (12, 3)-(12, 5), 6
LINE (11, 3)-(11, 4), 6
PSET (10, 3), 6
PSET (7, 5), 16
PSET (9, 5), 16
LINE (7, 8)-(9, 8), 89, BF
PSET (8, 9), 89
LINE (6, 9)-(7, 9), 6
LINE (9, 9)-(10, 9), 6
LINE (5, 10)-(11, 13), 6, BF
LINE (6, 14)-(10, 14), 6
LINE (5, 15)-(7, 15), 19
LINE (9, 15)-(11, 15), 19
LINE (4, 9)-(5, 9), 89
LINE (3, 10)-(4, 11), 89, BF
PSET (3, 12), 89
LINE (11, 9)-(12, 9), 89
LINE (12, 10)-(13, 11), 89, BF
PSET (13, 12), 89
LINE (5, 12)-(11, 12), 117
PSET (8, 12), 14
GET (1, 1)-(15, 15), clerk2

CLS

END SUB

SUB LoadMap

FOR y = 1 TO mapy
                                        
FOR x = 1 TO mapx

INPUT #1, map(x, y)
                                        
NEXT x
NEXT y

CLOSE #1

END SUB

SUB Magic

x = 40
y = 40
LINE (1 + x, 1 + y)-(100 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 46 + y), 23, B
LINE (6 + x, 6 + y)-(95 + x, 45 + y), 16, BF


LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) AND gold >= 100 THEN gold = gold - 100: fire = fire + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: amagic = amagic + 1: LOCATE 5, 24: COLOR 24: PRINT "Magic   "; amagic
IF y = 61 AND GASTON$ = CHR$(32) AND gold >= 100 THEN gold = gold - 100: ice = ice + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: amagic = amagic + 1: LOCATE 5, 24: COLOR 24: PRINT "Magic   "; amagic
IF y = 91 AND GASTON$ = CHR$(32) AND gold >= 100 THEN gold = gold - 100: harm = harm + 1: LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold: amagic = amagic + 1: LOCATE 5, 24: COLOR 24: PRINT "Magic   "; amagic


IF y = 121 AND GASTON$ = CHR$(32) THEN CLS : Drawscreen: Pd: Drawbox: Inventory: EXIT SUB


COLOR 7: IF y = 31 THEN LOCATE 7, 7: PRINT "Fire   100"
COLOR 7: IF y = 61 THEN LOCATE 8, 7: PRINT "Ice    100"
COLOR 7: IF y = 91 THEN LOCATE 9, 7: PRINT "Harm   100"
COLOR 7: IF y = 121 THEN LOCATE 10, 7: PRINT "Back"


IF y <> 31 THEN COLOR 24: LOCATE 7, 7: PRINT "Fire   100"
IF y <> 61 THEN COLOR 25: LOCATE 8, 7: PRINT "Ice    100"
IF y <> 91 THEN COLOR 25: LOCATE 9, 7: PRINT "Harm   100"
IF y <> 121 THEN COLOR 25: LOCATE 10, 7: PRINT "Back"


IF y > 121 THEN y = 31
IF y < 31 THEN y = 121

WEND
CLS : Drawscreen: Pd: Drawbox: Inventory: EXIT SUB

END SUB

SUB Menu
CLS
begining:

CLS

COLOR 23: LOCATE 3, 12: PRINT "Adventures of Gasin"

x = 110
y = 50

LINE (1 + x, 1 + y)-(100 + x, 70 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 69 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 68 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 67 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 66 + y), 23, B

LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) THEN selectplayers: EXIT SUB
IF y = 61 AND GASTON$ = CHR$(32) THEN GOTO Load
IF y = 91 AND GASTON$ = CHR$(32) THEN LOCATE 1, 1: PRINT "Not installed"
IF y = 121 AND GASTON$ = CHR$(32) THEN GOTO leave

COLOR 7: IF y = 31 THEN LOCATE 9, 19: PRINT "Game"
COLOR 7: IF y = 61 THEN LOCATE 10, 19: PRINT "Load"
COLOR 7: IF y = 91 THEN LOCATE 11, 19: PRINT "Help"
COLOR 7: IF y = 121 THEN LOCATE 12, 19: PRINT "Quit"

IF y <> 31 THEN COLOR 22: LOCATE 9, 19: PRINT "Game"
IF y <> 61 THEN COLOR 23: LOCATE 10, 19: PRINT "Load"
IF y <> 91 THEN COLOR 24: LOCATE 11, 19: PRINT "Help"
IF y <> 121 THEN COLOR 25: LOCATE 12, 19: PRINT "Quit"

IF y > 121 THEN y = 31
IF y < 31 THEN y = 121

WEND


leave:
Gameover
END

Load:
Loadgame

END SUB

SUB pay
gold = gold - 5
IF gold <= 0 THEN gold = 0
LOCATE 3, 31: PRINT gold
payrnd = 1
clearing

IF payrnd = 1 AND knife = 0 THEN
LOCATE 16, 5: COLOR 23: PRINT "Thats not enough"
LOCATE 17, 5: COLOR 24: PRINT "gold."
SLEEP
END IF

IF payrnd = 1 AND knife >= 2 THEN
knife = knife - 1
LOCATE 16, 5: COLOR 23: PRINT "Don't you ever"
LOCATE 17, 5: COLOR 23: PRINT "learn."

SLEEP
EXIT SUB
END IF


IF payrnd = 1 AND knife = 1 THEN
IF knife = 0 THEN knife = 0: EXIT SUB
knife = knife - 1
LOCATE 16, 5: COLOR 23: PRINT "He steals your "
LOCATE 17, 5: COLOR 24: PRINT "knife, and takes"
LOCATE 18, 5: COLOR 24: PRINT "your money."
SLEEP
END IF


END SUB

SUB Pd
Drawscreen

IF playerselect = 1 THEN
PUT (ppx, ppy), playerdownmask, AND
PUT (ppx, ppy), playerdown, OR
END IF



IF playerselect = 4 THEN
PUT (ppx, ppy), wmagedownmask, AND
PUT (ppx, ppy), wmagedown, OR
END IF


END SUB

SUB Pl
Drawscreen

IF playerselect = 1 THEN
PUT (ppx, ppy), playerleftmask, AND
PUT (ppx, ppy), playerleft, OR
END IF


IF playerselect = 4 THEN
PUT (ppx, ppy), wmageleftmask, AND
PUT (ppx, ppy), wmageleft, OR
END IF

END SUB

SUB Potion
potions = potions + 1
gold = gold - 30
LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold
LOCATE 7, 24: COLOR 26: PRINT "Potions "; potions
END SUB

SUB Pr
Drawscreen

IF playerselect = 1 THEN
PUT (ppx, ppy), playerrightmask, AND
PUT (ppx, ppy), playerright, OR
END IF


IF playerselect = 4 THEN
PUT (ppx, ppy), wmagerightmask, AND
PUT (ppx, ppy), wmageright, OR
END IF

END SUB

SUB Pu

Drawscreen
IF playerselect = 1 THEN
PUT (ppx, ppy), playerupmask, AND
PUT (ppx, ppy), playerup, OR
END IF

IF playerselect = 4 THEN
PUT (ppx, ppy), wmageupmask, AND
PUT (ppx, ppy), wmageup, OR
END IF


END SUB

SUB Savegame

x = 40
y = 40
LINE (1 + x, 1 + y)-(100 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(99 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(98 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(97 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(96 + x, 46 + y), 23, B
LINE (6 + x, 6 + y)-(95 + x, 45 + y), 16, BF

LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) AND gold >= 30 THEN
saver
GOTO skiper
END IF

IF y = 61 AND GASTON$ = CHR$(32) THEN
CLS
Drawscreen
Pd
Drawbox
Inventory
EXIT SUB
END IF

COLOR 7: IF y = 31 THEN LOCATE 7, 7: PRINT "Yes    30"
COLOR 7: IF y = 61 THEN LOCATE 8, 7: PRINT "No       "

IF y <> 31 THEN COLOR 24: LOCATE 7, 7: PRINT "Yes    30"
IF y <> 61 THEN COLOR 25: LOCATE 8, 7: PRINT "No       "

IF y > 61 THEN y = 31
IF y < 31 THEN y = 61

WEND

skiper:

x = 30
y = 40
LINE (1 + x, 1 + y)-(180 + x, 25 + y), 23, B
LINE (2 + x, 2 + y)-(179 + x, 24 + y), 24, B
LINE (3 + x, 3 + y)-(178 + x, 23 + y), 25, B
LINE (4 + x, 4 + y)-(177 + x, 22 + y), 24, B
LINE (5 + x, 5 + y)-(176 + x, 21 + y), 23, B
LINE (6 + x, 6 + y)-(175 + x, 20 + y), 16, BF


LOCATE 7, 6: INPUT "Name: ", file$
OPEN "c:\Gasin\" + file$ + ".sav" FOR OUTPUT AS #1

PRINT #1, life
PRINT #1, gold
PRINT #1, HP
PRINT #1, experience
PRINT #1, potions
PRINT #1, playerselect
PRINT #1, fire
PRINT #1, ice
PRINT #1, harm
PRINT #1, sword
PRINT #1, knife
PRINT #1, axe
PRINT #1, weapon
PRINT #1, amagic
CLOSE
CLS

Drawscreen
Pd

END SUB

SUB saver
gold = gold - 30
LOCATE 4, 24: COLOR 23: PRINT "Gold    "; gold

END SUB

SUB selectplayers

loadgraphics

x = 90
y = 30

LINE (1 + x, 1 + y)-(50 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(49 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(48 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(47 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(46 + x, 46 + y), 23, B
PUT (109, 50), playerdown
COLOR 7: LOCATE 3, 12: PRINT "Fighter"

x = 162
y = 30

LINE (1 + x, 1 + y)-(50 + x, 50 + y), 23, B
LINE (2 + x, 2 + y)-(49 + x, 49 + y), 24, B
LINE (3 + x, 3 + y)-(48 + x, 48 + y), 25, B
LINE (4 + x, 4 + y)-(47 + x, 47 + y), 24, B
LINE (5 + x, 5 + y)-(46 + x, 46 + y), 23, B
PUT (180, 50), wmagedown
COLOR 7: LOCATE 3, 21: PRINT "W. Mage"

LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "K" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "M" THEN LET y = y - 30

IF y = 31 AND GASTON$ = CHR$(32) THEN playerselect = 1: EXIT SUB
IF y = 61 AND GASTON$ = CHR$(32) THEN playerselect = 4: EXIT SUB

COLOR 7: IF y = 31 THEN LOCATE 3, 12: PRINT "Fighter"
COLOR 7: IF y = 61 THEN LOCATE 3, 21: PRINT "W. Mage"

IF y <> 31 THEN COLOR 22: LOCATE 3, 12: PRINT "Fighter"
IF y <> 61 THEN COLOR 23: LOCATE 3, 21: PRINT "W. Mage"

IF y > 61 THEN y = 31
IF y < 31 THEN y = 61

WEND
playerselect = 1
END SUB

SUB showlife
LOCATE 9, 26: COLOR 28: PRINT "Drake"; bosslife
END SUB

SUB Talk

Drawbox


a$ = "Hi,my name is"
COLOR 20
LOCATE 2, 2
FOR x = 1 TO LEN(a$)
PRINT MID$(a$, x, 1);
FOR B = 1 TO 2000
NEXT B
NEXT x

B$ = "Kafin and I"
COLOR 22
LOCATE 3, 2
FOR x = 1 TO LEN(a$)
PRINT MID$(B$, x, 1);
FOR B = 1 TO 2000
NEXT B
NEXT x

c$ = "am a clerk."
COLOR 24
LOCATE 4, 2
FOR x = 1 TO LEN(a$)
PRINT MID$(c$, x, 1);
FOR B = 1 TO 2000
NEXT B
NEXT x


SLEEP

beginning2:

Drawbox
Inventory

LET y = 31
WHILE GASTON$ <> CHR$(27)
LET GASTON$ = INKEY$

IF GASTON$ = CHR$(0) + "P" THEN LET y = y + 30
IF GASTON$ = CHR$(0) + "H" THEN LET y = y - 30


COLOR 7: IF y = 31 THEN LOCATE 2, 2: PRINT "Weapons"
COLOR 7: IF y = 61 THEN LOCATE 3, 2: PRINT "Magic"
COLOR 7: IF y = 91 THEN LOCATE 4, 2: PRINT "Health"
COLOR 7: IF y = 121 THEN LOCATE 5, 2: PRINT "Save"
COLOR 7: IF y = 151 THEN LOCATE 6, 2: PRINT "Leave"


IF y <> 31 THEN COLOR 23: LOCATE 2, 2: PRINT "Weapons"
IF y <> 61 THEN COLOR 24: LOCATE 3, 2: PRINT "Magic"
IF y <> 91 THEN COLOR 25: LOCATE 4, 2: PRINT "Health"
IF y <> 121 THEN COLOR 26: LOCATE 5, 2: PRINT "Save"
IF y <> 151 THEN COLOR 26: LOCATE 6, 2: PRINT "Leave"

IF y = 31 AND GASTON$ = CHR$(32) THEN buyweapons
IF y = 61 AND GASTON$ = CHR$(32) THEN Magic
IF y = 91 AND GASTON$ = CHR$(32) THEN Health
IF y = 121 AND GASTON$ = CHR$(32) THEN Savegame: GOTO beginning2
IF y = 151 AND GASTON$ = CHR$(32) THEN GOTO leaves


IF y > 151 THEN y = 31
IF y < 31 THEN y = 151

WEND
leaves:
CLS

Drawscreen
Pd
Display

END SUB

SUB win

LOCATE 16, 5: PRINT "Drake is defeated"
LOCATE 17, 5: PRINT "and the village of"
LOCATE 18, 5: PRINT "Provoka is now safe."

SLEEP
CLS
COLOR 23: LOCATE 8, 13: PRINT "Congratulations"
COLOR 24: LOCATE 10, 13: PRINT "    You Win    "

SLEEP

END
END SUB

