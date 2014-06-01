@echo off
color 70
set ver=1.9.92
title realRPG v%ver%
set /a sel=1
:start

REM ------ERROR CODES------ (last updated 1.8.5)
REM 1 - inn glitch: line 135
REM 2 - no man called: line 291
REM 3 - no option selected on death: line 537

echo Welcome to realRPG v%ver%
echo      UPDATES
echo - Fixed heal spell
echo - Lets you fight al the monsters
echo - Fixed Vitality
echo - Buffed Spells
echo - Added stat previews to stats menu
echo - Now shows gold in stores
echo - Can't buy things without money anymore
echo - Fixed various grammar issues in library
echo - Added new book (magic)
echo - Nerfed flawless victory
echo - Finished Flawless victory
echo - New reward system
echo - Added use for Int
echo - Added use for Wis
echo. 
echo.
pause
:namechar
cls
echo Enter character's name:
set /p charname=

REM -------SETUP--------

:1stsetup
set /a spellsactive=1
set /a spellslot1name=0
set spellslot1dmg=
set spellsuccess1=
set spellcheckslot1=
set /a spellslot2name=0
set spellslot2dmg=
set spellsuccess2=
set spellcheckslot2=
set /a spellslot3name=0
set spellslot3dmg=
set spellsuccess3=
set spellcheckslot3=
set /a spellslot4name=0
set spellslot4dmg=
set spellsuccess4=
set spellcheckslot4=
set /a spellslot5name=0
set spellslot5dmg=
set spellsuccess5=
set spellcheckslot5=
set weaponslot1=
set /a wepslot1atk=0
set /a wepslot1def=0
set /a wepslot1dmg=0
set weaponslot2=
set /a wepslot2atk=0
set /a wepslot2def=0
set /a wepslot2dmg=0
set weaponslot3=
set /a wepslot3atk=0
set /a wepslot3def=0
set /a wepslot3dmg=0
set shieldslot=
set weapon=default
set /a wepatk=0
set /a gold=0
set /a charstr=1
set /a chardef=1
set /a charvit=1
set /a charint=1
set /a charwis=1
set /a wepdmg=0
set /a wepatk=0
set /a wepdef=0
set /a dmg=0
set /a MaxHP=100
set /a TempHP=100
set /a charlvl=1
set /a exp=0
set /a nxtlvlexp=1000
cls
echo Welcome to Saltonia, %charname%.
goto :town
REM -----------------------------CHEATS----------------------------

:cheat.allgold
set /a gold=9999
REM --------------------------------TOWN-----------------------------

:town
echo %charname% -- Level: %charlvl% -- HP: %TempHP%/%MaxHP%
echo Exp: %exp%/%nxtlvlexp% -- Gold: %gold% -- Weapon: %weapon%
echo Select an option.
echo 1 - INN
echo 2 - FIGHT
echo 3 - STATS
echo 4 - INVENTORY
echo 5 - SPELLS
echo.
set /p sel=

if %sel% EQU 1 (
cls
goto inn
)

if %sel% EQU 2 (
cls
goto fight
)
if %sel% EQU 3 (
cls
goto stats
)
if %sel% EQU 4 (
cls
goto inv
)
if %sel% EQU 5 (
cls
goto spells
)
cls
echo You did not choose something correctly.
goto town

:spells
echo %charname%'s known spells.
echo 1 - %spellslot1name%
echo 2 - %spellslot2name%
echo 3 - %spellslot3name%
echo 4 - %spellslot4name%
echo 5 - %spellslot5name%
pause
cls
goto town

REM ---------INV---------

:inv
echo %charname%'s inventory:
echo  Equip?
echo 1 - %weaponslot1%
echo 2 - %weaponslot2%
echo 3 - %weaponslot3%
echo.
echo 4 - Cancel
echo.
set /p sel=
if %sel%==1 (
goto equipslot1

)
if %sel%==2 (
goto equipslot2

)
if %sel%==3 (
goto equipslot3

)
if %sel%==4 (
cls
goto town
)
cls
goto town

:equipslot1
set weapon=%weaponslot1%
set /a wepatk=%wepslot1atk%
set /a wepdef=%wepslot1def%
set /a wepdmg=%wepslot1dmg%
cls
echo Equipped %weaponslot1%
goto town
:equipslot2
set weapon=%weaponslot2%
set /a wepatk=%wepslot2atk%
set /a wepdef=%wepslot2def%
set /a wepdmg=%wepslot2dmg%
cls
echo Equipped %weaponslot2%
goto town
:equipslot3
set weapon=%weaponslot3%
set /a wepatk=%wepslot3atk%
set /a wepdef=%wepslot3def%
set /a wepdmg=%wepslot3dmg%
cls
echo Equipped %weaponslot3%
goto town

:stats
set /a stratkexample=%charstr%*2
set /a defexample=%chardef%*3
set /a vitexample=%charvit%*20-20
set /a intexample=%charint%*2
echo %charname%'s stats:
echo STR: %charstr%  +%stratkexample% Attack Roll, +%charstr% Damage
echo DEF: %chardef%  +%defexample% Defence Roll
echo VIT: %charvit%  +%vitexample% HP
echo INT: %charint%  +%intexample% Spell Roll
echo WIS: %charwis%  x%charwis% Spell Damage
echo.
pause
cls
goto town
REM ------------------------------INN-------------------------------

:inn
echo Welcome to the inn.
echo 1 - Sleep (heal)
echo 2 - Buy
echo 3 - Library
echo 4 - Leave
echo Select an option.
set /p sel=

if %sel%==1 (
cls
goto sleep
)
if %sel%==2 (
cls
goto shop
)
if %sel%==3 (
cls
goto library
)
if %sel%==4 (
cls
goto town
)
cls
echo You did not choose something correctly.
goto inn
:library
echo Welcome to the library. Please be quiet.
echo.
echo 1 - Spell Shop
echo 2 - Books
echo 3 - Leave
echo.
set /p sel=

if %sel%==1 (
cls
goto library.spells
)
if %sel%==2 (
cls
goto library.books
)
if %sel%==3 (
cls
goto inn
)
cls
echo You did not choose something correctly.
goto library
:library.spells
REM Spell check: 1 = Spell will Always hit. / 0 = Spell has a roll
echo Choose a spell to buy.    %gold% Gold
echo.
echo 1 - Fireball :: 5 Damage :: 100 Gold
echo 2 - Frost :: 2 Damage :: 50 Gold
echo 3 - Heal :: Heals 20 points :: 100 Gold
echo.
echo 0 - Leave
set /p sel=
if %sel%==1 (
cls
goto spell.buy.Fireball
)
if %sel%==2 (
cls
goto spell.buy.Frost
)
if %sel%==3 (
cls
goto spell.buy.Heal
)
if %sel%==0 (
cls
goto library
)
cls
echo You did not choose something correctly.
goto library

:spell.buy
echo Confirm Purchase?
echo %buyspellname% - %
echo 1 - Confirm
echo 2 - Cancel
echo.
set /p sel=
if %sel%==1 (
cls
goto spell.pricecheck
)
goto spell.assign
if %sel%==2 (
cls
goto library.spells
)
cls
echo You did not choose something correctly.
goto library

:spell.pricecheck
if %gold% LSS %buyspellcost% (
cls
echo Not enough money!
goto library.spells
)
:spell.assign
echo Assign to slot
echo.
echo 1 - %spellslot1name%
echo 2 - %spellslot2name%
echo 3 - %spellslot3name%
echo 4 - %spellslot4name%
echo 5 - %spellslot5name%
echo 6 - Cancel
set /p sel=
if %sel%==1 (
cls
goto as.spell.1
)
if %sel%==2 (
cls
goto as.spell.2
)
if %sel%==3 (
cls
goto as.spell.3
)
if %sel%==4 (
cls
goto as.spell.4
)
if %sel%==5 (
cls
goto as.spell.5
)
if %sel%==6 (
cls
goto library.spells
)
cls
echo You did not choose something correctly.
goto spell.assign
:as.spell.1
set /a spellsactive=1
set /a gold=%gold%-%buyspellcost%
set spellslot1name=%buyspellname%
set /a  spellslot1dmg=%shopspelldmg%
set /a  spellcheckslot1=%shopspellcheck%
set /a  spellsuccess1=%shopspellsuccess%
set /a spellheal1=%shopspellheal%
set /a spellcanheal1=%shopspellcanheal%
cls
echo got spell
goto town
:as.spell.2
set /a spellsactive=1
set /a gold=%gold%-%buyspellcost%
set spellslot2name=%buyspellname%
set /a spellslot2dmg=%shopspelldmg%
set /a spellcheckslot2=%shopspellcheck%
set /a spellsuccess2=%shopspellsuccess%
set /a spellheal2=%shopspellheal%
set /a spellcanheal2=%shopspellcanheal%
cls
echo got spell
goto town

:as.spell.3
set /a spellsactive=1
set /a gold=%gold%-%buyspellcost%
set spellslot3name=%buyspellname%
set /a spellslot3dmg=%shopspelldmg%
set /a spellcheckslot3=%shopspellcheck%
set /a spellsuccess3=%shopspellsuccess%
set /a spellheal3=%shopspellheal%
set /a spellcanheal3=%shopspellcanheal%
cls
echo got spell
goto town

:as.spell.4
set /a spellsactive=1
set /a gold=%gold%-%buyspellcost%
set spellslot4name=%buyspellname%
set /a spellslot4dmg=%shopspelldmg%
set /a spellcheckslot4=%shopspellcheck%
set /a spellsuccess4=%shopspellsuccess%
set /a spellheal4=%shopspellheal%
set /a spellcanheal4=%shopspellcanheal%
cls
echo got spell
goto town

:as.spell.5
set /a spellsactive=1
set /a gold=%gold%-%buyspellcost%
set spellslot5name=%buyspellname%
set /a spellslot5dmg=%shopspelldmg%
set /a spellcheckslot5=%shopspellcheck%
set /a spellsuccess5=%shopspellsuccess%
set /a spellheal5=%shopspellheal%
set /a spellcanheal5=%shopspellcanheal%
cls
echo got spell
goto town


:spell.buy.Heal
set buyspellname=Heal
set /a buyspellcost=150
set /a shopspellcheck=0
set /a shopspellsuccess=10
set /a shopspelldmg=5
set /a shopspellheal=20
set /a shopspellcanheal=1
goto spell.buy
:spell.buy.Fireball
set buyspellname=Fireball
set /a buyspellcost=100
set /a shopspellcheck=0
set /a shopspellsuccess=7
set /a shopspelldmg=20
set /a shopspellheal=0
set /a shopspellcanheal=0
goto spell.buy
:spell.buy.Frost
set buyspellname=Frost
set /a buyspellcost=50
set /a shopspellcheck=1
set /a shopspellsuccess=0
set /a shopspelldmg=10
set /a shopspellheal=0
set /a shopspellcanheal=0
goto spell.buy
:spell.buy.Template
REM Name of the spell
set buyspellname=
REM Cost of the spell
set /a buyspellcost=
REM Does the spell check accuracy? 1=No 0=Yes
set /a shopspellcheck=
REM Number to roll to succeed, ignore if spellcheck is 1
set /a shopspellsuccess=
REM Amount of damage the spell does
set /a shopspelldmg=
REM Does this spell heal you? 1=Yes 0=No
set /a shopspellcanheal=
REM Amount the spell heals you
set /a shopspellheal=
goto spell.buy
:library.books
echo The library is full of information.
echo 1 - Lore
echo 2 - Creatures
echo 3 - Weapons
echo 4 - Magic
echo 5 - Leave
echo Select an option.
set /p sel=

if %sel%==1 (
cls
goto library.lore
)
if %sel%==2 (
cls
goto library.creatures
)
if %sel%==3 (
cls
goto library.weapons
)
if %sel%==4 (
cls
goto library.magic
)
if %sel%==5 (
cls
goto library
)
cls
echo You did not choose something correctly.
goto library.books
:library.lore
goto library.non
:library.creatures
echo There are various creatues that dwell in the kingdom of Saltonia.
echo Find information of various creatures here.
echo 1 - Humans
echo 2 - Lizard
echo 3 - Skeleton
echo 4 - Wolf
echo 5 - Bear
echo 6 - Lion
echo 7 - Crocodile
echo 8 - Zombie
echo 9 - More...
echo 0 - Back
set /p sel=

if %sel%==1 (
cls
goto library.creatures.human
)
if %sel%==2 (
cls
goto library.creatures.lizard
)
if %sel%==3 (
cls
goto library.creatures.skeleton
)
if %sel%==4 (
cls
goto library.creatures.wolf
)
if %sel%==5 (
cls
goto librarby.creatures.bear
)
if %sel%==6 (
cls
goto library.creatures.lion
)
if %sel%==7 (
cls
goto library.creatures.crocodile
)
if %sel%==8 (
cls
goto library.creatures.zombie
)
if %sel%==9 (
cls
goto library.creatures.more
)
if %sel%==0 (
cls
goto library
)
cls
echo You did not choose something correctly.
goto library.creatures
:library.creatures.human
goto library.non
:library.creatures.lizard
echo - Lizards are evenly rare (1/10).
echo - Lizards are seemingly more common that some monsters.
echo - Lizards will only spawn a couple of levels above you.
echo - Lizards have only one attack, melee.
pause
cls
goto library.creatures
:library.creatures.skeleton
goto library.non
:library.creatures.wolf
goto library.non
:library.creatures.bear
goto library.non
:library.creatures.lion
goto library.non
:library.creatures.crocodile
goto library.non
:library.creatures.zombie
goto library.non
:library.creatures.witch
goto library.non
:library.creatures.dragon
echo - Dragons are evenly rare (1/10).
echo - They can be found in the Forest.
echo - The dragon is known to have higher defence and higher attack rolls 
echo   as well as damage.
echo - The dragon's primary weapon is claws.
echo - A dragon can use it's fire breath in a powerful attack.
echo - Sometimes dragons drop rare weapons.
pause
cls
goto library.creatures.more
:library.creatures.more
echo 1 - Witch
echo 2 - Dragon
echo 3 - Falcon
echo 9 - Previous...
echo 0 - Leave
set /p sel=
if %sel%==1 (
cls
goto library.creatures.witch
)
if %sel%==2 (
cls
goto library.creatures.dragon
)
if %sel%==3 (
cls
goto library.creatures.falcon
)
if %sel%==9 (
cls
goto library.creatures
)
if %sel%==0 (
cls
goto library
)
cls
echo You did not choose something correctly.
goto library.creatures.more
:library.weapons
echo Melee Weapons
echo  Melee weapons are objects that are held in the hand for
echo  attacking opponents.
echo The current melee weapons are:
echo  1 - Sword
echo  2 - Pike
echo  3 - Scimitar
echo  4 - Knife
echo  5 - Halberd
echo Ranged Weapons
echo  Ranged weapons are used to attack enemies without getting
echo  in range for an opponent's attack
echo There are currently no ranged weapons.
echo  0 - Back
set /p sel=
if %sel%==1 (
cls
goto library.weapons.sword
)
if %sel%==2 (
cls
goto library.weapons.pike
)
if %sel%==3 (
cls
goto library.weapons.scimitar
)
if %sel%==4 (
cls
goto library.weapons.knife
)
if %sel%==5 (
cls
goto library.weapons.halberd
)
if %sel%==0 (
cls
goto library.books
)
cls
echo You did not choose something correctly.
goto library.weapons
cls
:library.weapons.sword
echo The sword does +1 damage.
pause
cls
goto library.weapons
:library.weapons.pike
echo The pike does +2 damage.
pause
cls
goto library.weapons
:library.weapons.scimitar
echo The scimitar does +2 damage, and adds 3 to your attack roll.
pause
cls
goto library.weapons
:library.weapons.knife
echo The knife adds 2 to your attack roll.
pause
cls
goto library.weapons
:library.weapons.halberd
echo The halberd does +3 Damage, adds 2 to your defence roll and adds
echo  1 to your attack roll.
pause
cls
goto library.weapons
:library.magic
echo Spells
echo  Spells come in two forms.
echo  SPELLS and SCROLLS.
echo Spells are abilities purchasable from the library.
echo  Spells can be used an infinite number of times, but are
echo  generally weak.
echo Scrolls can be won by killing skeletons or purchased from a store.
pause
cls
goto library.books

:library.non
cls
echo This section is not yet available.
pause
cls
goto library.books
:sleep
if %TempHP% EQU %MaxHP% (
goto alreadyhealed
)
echo Slept and recovered hp!
set /a diff=%MaxHP%-%TempHP%
set /a TempHP=%MaxHP%
echo +%diff%
pause
cls

goto inn
:alreadyhealed
echo You are already full health!
pause
cls
goto inn

REM -----------------------------SHOP-----------------------------
REM  With the current system, if you add a new weapon, don't forget
REM   to add it to the list of weapons that can be selected in the 
REM    Inventory section!
:shop
echo The shop is open!   %gold% Gold
echo.
echo 1 - Sword :: +1 Dmg :: 40 Gold
echo 2 - Pike :: +2 Dmg :: 100 Gold
echo 3 - Scimitar :: +2 Dmg +1 AtkRoll :: 250 Gold
echo 4 - Knife :: +1 AtkRoll :: 25 Gold
echo 5 - Halberd :: +1 AtkRoll +1 DefRoll :: 120 Gold
echo 0 - Leave
echo.
set /p sel=
if %sel%==1 (
cls
goto buysword
)
if %sel%==2 (
cls
goto buypike
)
if %sel%==3 (
cls
goto buyscimitar
)
if %sel%==4 (
cls
goto buyknife
)
if %sel%==5 (
cls
goto buyhalberd
)
if %sel%==0 (
cls
goto inn
)

cls
echo You did not choose something correctly.
goto shop
:buy
cls
echo Confirm buy %buywep%?
echo Cost: %wepprice% Gold
echo You have: %gold% Gold
echo.
echo 1 - Confirm
echo 2 - Cancel
echo.
set /p sel=


if %sel%==1 (
goto pricecheck
)

if %sel%==2 (
goto shop
)
cls 
echo You did not choose something correctly.
goto buy
:pricecheck
if %gold% LSS %wepprice% (
cls
echo Not enough money!
goto :shop
)
:assignslot
cls
echo Assign inventory slot:
echo.
echo 1 - %weaponslot1%
echo 2 - %weaponslot2%
echo 3 - %weaponslot3%
echo 4 - Cancel
echo.
set /p sel=
if %sel%==1 (
cls
goto assignslot1
)
if %sel%==2 (
cls
goto assignslot2
)
if %sel%==3 (
cls
goto assignslot3
)
if %sel%==4 (
cls
echo Cancelled.
goto shop
)
cls
echo You did not choose something correctly.
goto assignslot
:buyhalberd
set buywep=Halberd
set /a wepprice=120
set /a swepatk=1
set /a swepdef=2
set /a swepdmg=3
goto buy
:buyknife
set buywep=Knife
set /a wepprice=25
set /a swepatk=2
set /a swepdef=0
set /a swepdmg=0
goto buy
:buysword
set buywep=Sword
set /a wepprice=40
set /a swepatk=0
set /a swepdef=0
set /a swepdmg=1
goto buy
:buypike
set buywep=Pike
set /a wepprice=100
set /a swepatk=0
set /a swepdef=0
set /a swepdmg=2
goto buy
:buyscimitar
set buywep=Scimitar
set /a wepprice=250
set /a swepatk=3
set /a swepdef=0
set /a swepdmg=2
goto buy
:buytemplate
REM Name of weapon
set buywep=
REM Price of weapon
set /a wepprice=
REM Bonus to attack roll
set /a swepatk=
REM Bonus to defence roll
set /a swepdef=
REM Bonus to damage
set /a swepdmg=
goto buy

:assignslot1
set slotnum=1
set weaponslot1=%buywep%
set /a wepslot1atk=%swepatk%
set /a wepslot1def=%swepdef%
set /a wepslot1dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
set /a gold=%gold%-%wepprice%
cls
goto town
:assignslot2
set slotnum=2
set weaponslot2=%buywep%
set /a wepslot2atk=%swepatk%
set /a wepslot2def=%swepdef%
set /a wepslot2dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
set /a gold=%gold%-%wepprice%
cls
goto town
:assignslot3
set slotnum=3
set weaponslot3=%buywep%
set /a wepslot3atk=%swepatk%
set /a wepslot3def=%swepdef%
set /a wepslot3dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
set /a gold=%gold%-%wepprice%
cls
goto town


echo error code 1
pause
REM ------------------------------FIGHT----------------------------
:fight
REM fight.[whatever] allows you to load rules for certain fights, including enemy types, hp, etc.
echo Select area to fight:
echo 1 - Town (Humans)
echo 2 - Forest (Monsters)
echo 3 - Back
set /p sel=
if %sel%==1 (
cls
goto fight.town
)
if %sel%==2 (
cls
goto fight.forest
)
if %sel%==3 (
cls
goto town
)
cls
echo You didn't select something correctly.
goto fight


:fight.forest
set /a enemlvl=%charlvl%+%random% %%5
set /a enemtemphp=%enemhp%
set /a rrbonus=0
set /a racenum=%random% %%10 +1
if %racenum% EQU 1 (
goto lizardsetup
)
if %racenum% EQU 2 (
goto skeletonsetup
)
if %racenum% EQU 3 (
goto wolfsetup
)
if %racenum% EQU 4 (
goto bearsetup
)
if %racenum% EQU 5 (
goto lionsetup
)
if %racenum% EQU 6 (
goto crocodilesetup
)
if %racenum% EQU 7 (
goto zombiesetup
)
if %racenum% EQU 8 (
goto witchsetup
)
if %racenum% EQU 9 (
goto dragonsetup
)
if %racenum% EQU 10 (
goto falconsetup
)
:lizardsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Lizard
set enemwep=Claws
goto fightinfo
:skeletonsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Skeleton
set enemwep=none
goto fightinfo
:wolfsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Wolf
set enemwep=Claws
goto fightinfo
:bearsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Bear
set enemwep=Claws
goto fightinfo
:lionsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Lion
set enemwep=Claws
goto fightinfo
:crocodilesetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Crocodile
set enemwep=Claws
goto fightinfo
:zombiesetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Zombie
set enemwep=none
goto fightinfo
:witchsetup
set /a Has2ndAtk=1
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Witch
set enemwep=none
set enemwep2=Magic
set /a enemwep2dmg=5
goto fightinfo
:dragonsetup
set /a Has2ndAtk=1
set /a isDragon=1
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=1
set /a enemstr=1
set /a enematk=1
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Dragon
set enemwep=Claws
set enemwep2=FireBreath
set /a enemwep2dmg=15
goto fightinfo
:falconsetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%5
set /a enemhp=%enemlvl%*20-20+100
set /a enemdef=0
set /a enemstr=0
set /a enematk=0
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Falcon
set enemwep=Claws
goto fightinfo


:fight.town
set /a rrbonus=0
set /a wepatk=0
set /a racenum=%random% %%10 +1
set /a enemwepdmg=0
if %racenum% GTR 0 (
goto mansetup
)
echo Error code 2
pause
:mansetup
set /a Has2ndAtk=0
set /a isDragon=0
set /a enemlvl=%charlvl%+%random% %%2
set /a enemhp=%enemlvl%*10-20+100
set /a enemdef=-%random% %%2
set /a enemstr=-%random% %%2
set /a enematk=-%random% %%2
set /a enemwepatk=0
set /a enemwepdmg=0
set /a enemdmg=10+%enemwepdmg%
set race=Man
set enemwep=none
goto fightinfo
:fightinfo
set /a enemtemphp=%enemhp%
echo You engage a level %enemlvl% %race%!
pause
cls
goto Roundstart
REM if you get a blank race or level, the race/lvl probably wasn't called

:Roundstart
cls
set /a dmg=10+%charstr%*5-5 +%wepdmg%
if %TempHP% LEQ 0 (
goto died
)
if %enemtemphp% LEQ 0 (
goto winfight
)
echo %charname% -- Level: %charlvl% -- %TempHP%/%MaxHP% HP -- Weapon: %weapon%
echo %race%-- Level: %enemlvl% -- %enemtemphp%/%enemhp% HP -- Weapon: %enemwep%
echo 1 - Melee
if %spellsactive% EQU 1 (
goto spellsfight
)
echo 2 - Run (50%)
set /p sel=
if %sel%==1 (
goto melee
)
if %sel%==2 (
goto run
)
echo no command
pause
goto Roundstart
:spellsfight
echo 2 - Run (50%)
echo 0 - Spells
set /p sel=
if %sel%==1 (
goto melee
)
if %sel%==0 (
goto spellcast
)
if %sel%==2 (
goto run
)
:run
set /a run=%random% %%10 +1
if %run% GTR 5 (
cls
echo Escaped sucessfully!
goto town
)
cls
echo Couldn't escape!
echo.
goto enemturn
:spellcast
echo Cast a spell:
echo.
if %spellslot1name% EQU 0 (
goto spellcast.2
)
echo 1 - %spellslot1name%
:spellcast.2
if %spellslot2name% EQU 0 (
goto spellcast.3
)
echo 2 - %spellslot2name%
:spellcast.3
if %spellslot3name% EQU 0 (
goto spellcast.4
)
echo 3 - %spellslot3name%
:spellcast.4
if %spellslot4name% EQU 0 (
goto spellcast.5
)
echo 4 - %spellslot4name%
:spellcast.5
if %spellslot5name% EQU 0 (
goto spellcast.0
)
echo 5 - %spellslot5name%
:spellcast.0
echo 0 - Back
echo.
set /p sel=
if %sel%==1 (
goto spellcast.spell1
)
if %sel%==2 (
goto spellcast.spell2
)
if %sel%==3 (
goto spellcast.spell3
)
if %sel%==4 (
goto spellcast.spell4
)
if %sel%==5 (
goto spellcast.spell5
)
if %sel%==0 (
goto roundstart
)
echo You didn't select anything correctly.
pause
cls 
goto spellcast
:spellcast.safetynet
pause
goto spellcast
:spellcast.spell1
set spellname=%spellslot1name%
set /a spelldmg=%spellslot1dmg%
set /a spellcheck=%spellcheckslot1%
set /a spellsuccess=%spellsuccess1%
set /a spellheal=%spellheal1%
set /a spellcanheal=%spellcanheal1%
goto spellalg
:spellcast.spell2
set spellname=%spellslot2name%
set /a spelldmg=%spellslot2dmg%
set /a spellcheck=%spellcheckslot2%
set /a spellsuccess=%spellsuccess2%
set /a spellheal=%spellheal2%
set /a spellcanheal=%spellcanheal2%
goto spellalg
:spellcast.spell3
set spellname=%spellslot3name%
set /a spelldmg=%spellslot3dmg%
set /a spellcheck=%spellcheckslot3%
set /a spellsuccess=%spellsuccess3%
set /a spellheal=%spellheal3%
set /a spellcanheal=%spellcanheal3%
goto spellalg
:spellcast.spell4
set spellname=%spellslot4name%
set /a spelldmg=%spellslot4dmg%
set /a spellcheck=%spellcheckslot4%
set /a spellsuccess=%spellsuccess4%
set /a spellheal=%spellheal4%
set /a spellcanheal=%spellcanheal4%
goto spellalg
:spellcast.spell5
set spellname=%spellslot5name%
set /a spelldmg=%spellslot5dmg%
set /a spellcheck=%spellcheckslot5%
set /a spellsuccess=%spellsuccess5%
set /a spellheal=%spellheal5%
set /a spellcanheal=%spellcanheal5%
goto spellalg

:spellalg
if %spellcheck%==1 (
echo Used %spellname%
goto spellhit
)
echo Used %spellname%,
set /a spellroll=%random% %%20 +1 +%charint%*2 +%spelldmg%
if %spellcanheal% EQU 1 (
goto healspell
)
if %spellroll% GEQ %spellsuccess% (
goto spellhit
)
goto spellmiss
:spellhit
set /a spelldmgtotal=%spelldmg%*%charwis%
echo Spell hit!
echo Did %spelldmg% damage.
set /a enemtemphp=%enemtemphp%-%spelldmg%
pause
goto enemturn
:spellmiss
echo Spell failed!
pause
goto enemturn
:healspell
set /a TempHP=%TempHP%+%spellheal%
if %TempHP% LEQ %MaxHP% (
goto enemturn
)
set /a TempHP=%MaxHP%
goto enemturn
:melee
echo.
echo Used Melee,
set /a atkroll=%random% %%20 +1 +2*%charstr% +%wepatk%
set /a enemdefroll=%random% %%20 +1 +%enemdef%
echo You rolled %atkroll%
echo %race% rolled %enemdefroll%

if %atkroll% GTR %enemdefroll% (
goto hit
)
if %atkroll% LSS %enemdefroll% (
goto miss
)
if %atkroll% EQU %enemdefroll% (
goto block
)
:hit
echo You hit!
echo Did %dmg% damage.
set /a enemtemphp=%enemtemphp%-%dmg%
pause
goto enemturn
:miss
echo You missed!
pause
goto enemturn
:block
echo Attack was blocked!
pause
echo Rerolling...
echo.
set /a rrbonus=%rrbonus%+1
set /a atkroll=%random% %%20 +1 +%rrbonus% +%charstr% +%wepatk%
set /a enemdefroll=%random% %%20 +1 +%enemdef%
echo You rolled %atkroll%
echo %race% rolled %enemdefroll%

if %atkroll% EQU %enemdefroll% (
goto block
)
set /a rrbonus=0
if %atkroll% GTR %enemdefroll% (
goto hit
)
if %atkroll% LSS %enemdefroll% (
goto miss
)
pause

REM -----------------------ENEMY ATTACKS------------------------

:enem2ndatk.roll
echo %race% used %enemwep2%,
set /a enematkroll=%random% %%20 +1 +%enematk% +%enemwepatk%
set /a defroll=%random% %%20 +1 +%chardef%*3 +%wepdef%
set enemdmg=%enem2ndwepdmg%+%enemdmg%
if %defroll% LSS %enematkroll% (
goto enemhit
)
if %defroll% GTR %enematkroll% (
goto enemmiss
)
if %defroll% EQU %enematkroll% (
goto enemblock
)

:enem2ndatk
set /a use2nd=%random% %%20
if %use2nd% GTR 15 (
goto enem2ndatk.roll
)
goto enemmelee
:enemturn
if %Has2ndAtk% EQU 1 (
goto enem2ndatk
)
:enemmelee
echo.
echo %race% used Melee,
set /a enematkroll=%random% %%20 +1 +%enematk% +%enemwepatk%
set /a defroll=%random% %%20 +1 +%chardef%*2 +%wepdef%
echo %race% rolled %atkroll%
echo You rolled %defroll%

if %defroll% LSS %enematkroll% (
goto enemhit
)
if %defroll% GTR %enematkroll% (
goto enemmiss
)
if %defroll% EQU %enematkroll% (
goto enemblock
)
:enemhit
echo %race% hit!
echo Did %enemdmg% damage.
set /a TempHP=%TempHP%-%enemdmg%
pause
goto Roundstart
:enemmiss
echo %race% missed!
pause
goto Roundstart
:enemblock
echo Attack was blocked!
pause
echo Rerolling...
echo.
set /a rrbonus=%rrbonus%+1
set /a enematkroll=%random% %%20 +1 +%rrbonus% +%enematk% +%enemwepatk%
set /a defroll=%random% %%20 +1 +%chardef%*2 +%wepdef%
echo %race% rolled %enematkroll%
echo You rolled %defroll%

if %enematkroll% EQU %defroll% (
goto enemblock
)
set /a rrbonus=0
if %enematkroll% GTR %defroll% (
goto enemhit
)
if %enematkroll% LSS %defroll% (
goto enemmiss
)
pause
cls 
goto :fight.town

REM ----------------------WIN----------------------

:winfight
if %TempHP% EQU %MaxHP% (
goto extraloot
)
set /a currentexp=%exp%
set /a exp=%exp%+100+100*%enemlvl%
set /a newgold=10*%enemlvl%
:winstage1
set /a gold=%gold%+%newgold%
set /a newexp=%exp%
set /a expdiff=%newexp%-%currentexp%
:winstage2
echo You defeated %race%!
echo +%newgold% gold
if %exp% GEQ %nxtlvlexp% (
goto levelup
)
echo +%expdiff% Exp!
echo You now have %exp%/%nxtlvlexp% experience!
if %isDragon% EQU 1 (
goto DragonLoot
)
pause
cls
goto town

:extraloot
set /a currentexp=%exp%
set /a exp=%exp%+200+100*%enemlvl%
set /a newgold=20*%enemylvl%
echo Flawless Victory - Extra gold and EXP
goto winstage1

:DragonLoot
set /a dragonloot=%random% %%100 +%charint%*10
if %dragonloot% LSS 75 (
echo You didn't find any dragon loot.
pause
cls
goto town
)
echo You found a rare weapon!
set /a weaponrolldragon=%random% %%10
if %weaponrolldragon% LEQ 6 (
goto obsknife.dragon
)
if %weaponrolldragon% EQU 7 (
goto SoulOfDragon.dragon
)
if %weaponrolldragon GEQ 8 (
goto BoneSabre.dragon
)
:BoneSabre.dragon
cls
echo You found the very rare Bone Sabre!
pause
cls
set buywep=Bone Sabre
set /a swepatk=20
set /a swepdef=5
set /a swepdmg=45
echo Assign inventory slot:
echo.
echo 1 - Slot 1
echo 2 - Slot 2
echo 3 - Slot 3
echo 4 - Drop
echo.
set /p sel=
if %sel%==1 (
cls
goto assignslot1free
)
if %sel%==2 (
cls
goto assignslot2free
)
if %sel%==3 (
cls
goto assignslot3free
)
if %sel%==4 (
cls
echo Dropped Bone Sabre.
goto town
)
cls
echo You did not choose something correctly.
goto assignslot
:assignslot1free
set slotnum=1
set weaponslot1=%buywep%
set /a wepslot1atk=%swepatk%
set /a wepslot1def=%swepdef%
set /a wepslot1dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town
:assignslot2free
set slotnum=2
set weaponslot2=%buywep%
set /a wepslot2atk=%swepatk%
set /a wepslot2def=%swepdef%
set /a wepslot2dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town
:assignslot3free
set slotnum=3
set weaponslot3=%buywep%
set /a wepslot3atk=%swepatk%
set /a wepslot3def=%swepdef%
set /a wepslot3dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town


:obsknife.dragon
cls
echo You found the very rare Obsidian Knife!
pause
cls
set buywep=Obs. Knife
set /a swepatk=25
set /a swepdef=0
set /a swepdmg=10
echo Assign inventory slot:
echo.
echo 1 - Slot 1
echo 2 - Slot 2
echo 3 - Slot 3
echo 4 - Drop
echo.
set /p sel=
if %sel%==1 (
cls
goto assignslot1free
)
if %sel%==2 (
cls
goto assignslot2free
)
if %sel%==3 (
cls
goto assignslot3free
)
if %sel%==4 (
cls
echo Dropped Obs. Knife.
goto town
)
cls
echo You did not choose something correctly.
goto assignslot
:assignslot1free
set slotnum=1
set weaponslot1=%buywep%
set /a wepslot1atk=%swepatk%
set /a wepslot1def=%swepdef%
set /a wepslot1dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town
:assignslot2free
set slotnum=2
set weaponslot2=%buywep%
set /a wepslot2atk=%swepatk%
set /a wepslot2def=%swepdef%
set /a wepslot2dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town
:assignslot3free
set slotnum=3
set weaponslot3=%buywep%
set /a wepslot3atk=%swepatk%
set /a wepslot3def=%swepdef%
set /a wepslot3dmg=%swepdmg%
echo %buywep% set to inventory slot %slotnum%.
cls
goto town

:SouldOfDragon.dragon
echo wow well uh i didnt make this yet so heres 12000 gold
set gold=%gold%+12000
pause
cls
goto town 



REM -------------------------LEVEL UP---------------------------

:levelup
set /a MaxHP=100+20*%charlvl% + %charvit%*20-20
set /a nxtlvlexp=%nxtlvlexp%+500
set /a exp=0
set /a charlvl=%charlvl%+1
echo You leveled up!
echo +1 skill point
echo.
pause
cls
echo %charname%'s stats:
echo STR: %charstr%
echo DEF: %chardef%
echo VIT: %charvit%
echo INT: %charint%
echo WIS: %charwis%
echo.
echo Choose Upgrade
echo 1 - +1 STR
echo 2 - +1 DEF
echo 3 - +1 VIT
echo 4 - +1 INT
echo 5 - +1 WIS
echo.
set /p sel=
if %sel%==1 (
goto strup
)

if %sel%==2 (
goto defup
)

if %sel%==3 (
goto vitup
)
if %sel%==4 (
goto intup
)
if %sel%==5 (
goto wisup
)
goto town
:strup
cls
set /a charstr=%charstr%+1
echo STR is now %charstr%
pause
cls
goto town
:defup
cls
set /a chardef=%chardef%+1
echo DEF is now %chardef%
pause
cls
goto town
:vitup
cls
set /a charvit=%charvit%+1
echo VIT is now %charvit%
set /a MaxHP=100+20*%charlvl% + %charvit%*20-20
pause
cls
goto town
:intup
cls
set /a charint=%charint%+1
echo INT is now %charint%
pause
cls
goto town
:wisup
cls
set /a charwis=%charwis%+1
echo WIS is now %charwis%
pause
cls
goto town
:died
echo %charname% died.
echo %charname% was level %charlvl%.
echo %charname%'s stats:
echo STR: %charstr%
echo DEF: %chardef%
echo VIT: %charvit%
echo INT: %charint%
echo WIS: %charwis%
echo.
echo Select option:
echo 1 - New Game
echo 2 - Quit
set /p sel=
if %sel%==1 (
cls
goto start
)
if %sel%==2 (
exit
)
cls
echo Nothing was chosen
goto died
echo error code 3
pause


