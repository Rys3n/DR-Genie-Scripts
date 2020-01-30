# Climb Crossing Walls
# Based from original SF Script created by the player of Kraelyst
# Modified and made to work with Genie3 by Pelic and Shroom
# Note - Known bug, sometimes stalls out between 100-180 ranks on the E gate wall. Outside of those ranks it never seems to happen. 
#debuglevel 5

action goto WTF.WAIT when All this climbing back and forth is getting a bit tiresome

CRO.CLIMB:
     counter set 0
     if ($Athletics.LearningRate >= 29) then goto QUIT
CLIMB.EXP:
	if ($Athletics.LearningRate > 27) then goto QUIT
     
CLIMB:
startclimb:
     if ("$roomid" != "42") then gosub automove 42
     pause 0.3
     counter add 1
     echo
     echo *** STARTING CLIMBING SESSION %c ***
     echo
     pause 0.1
     put set roomname
     wait
CLIMBGO:
	gosub AUTOMOVE 387

CLIMB-001:
SAVE FAIL-001
	if ($stamina < 70) then gosub FATIGUE_WAIT
	pause 0.3
	if ($Athletics.Ranks >= 120) then put climb break
     if ($Athletics.Ranks < 120) then gosub CLIMB_PRACTICE break
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-001
	if "$zoneid" = "8" then goto PASS-001
	
PASS-001:
     pause 0.3
	gosub AUTOMOVE Crossing
	gosub AUTOMOVE 387
     goto CLIMB-002

FAIL-001:
     pause 0.5
     pause 0.1
     goto CLIMB-002

CLIMB-002:
SAVE FAIL-002
	if ($stamina < 70) then gosub FATIGUE_WAIT
	pause 0.5
	if ($Athletics.Ranks >= 120) then put climb embrasure
     if ($Athletics.Ranks < 120) then gosub CLIMB_PRACTICE embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-002
	if "$zoneid" = "7" then goto PASS-002
	
FAIL-002:
	pause 0.1
	gosub AUTOMOVE NTR

PASS-002:
	gosub move go footpath
	goto CLIMB-01

CLIMB-01:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-01
	pause 0.5
	if ($Athletics.Ranks >= 120) then put climb wall
     if ($Athletics.Ranks < 120) then gosub CLIMB_PRACTICE wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "8" then goto FAIL-01
	if "$zoneid" = "1" then goto PASS-01
	
PASS-01:
	gosub AUTOMOVE NTR
	gosub move go footpath
	goto FAIL-01

FAIL-01:
	gosub AUTOMOVE 45
	goto CLIMB-02

CLIMB-02:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-02
	pause 0.5
	if ($Athletics.Ranks >= 120) then put climb wall
     if ($Athletics.Ranks < 120) then gosub CLIMB_PRACTICE wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "8" then goto FAIL-02
	if "$zoneid" = "1" then goto PASS-02
	
PASS-02:
	gosub AUTOMOVE e gate
	gosub AUTOMOVE 44
	goto CLIMB-03

FAIL-02:
	gosub AUTOMOVE 44
	goto CLIMB-03

CLIMB-03:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-03
	pause 0.5
	put climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "8" then goto FAIL-03
	if "$zoneid" = "1" then goto PASS-03
	
PASS-03:
	gosub stand
	gosub AUTOMOVE e gate
	gosub AUTOMOVE 2
	goto CLIMB-04

FAIL-03:
	gosub AUTOMOVE 2
	goto CLIMB-04

CLIMB-04:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-04
	pause 0.5
	put climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "8" then goto FAIL-04
	if "$zoneid" = "1" then goto PASS-04

FAIL-04:
	if ($stamina < 60) then gosub FATIGUE_WAIT
	SAVE FAIL-04
	gosub AUTOMOVE crossing
   	gosub AUTOMOVE 395

PASS-04:
	goto CLIMB-05

CLIMB-05:
	if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-05
	pause 0.5
	put climb embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-05
	if "$zoneid" = "8" then goto PASS-05

PASS-05:
	gosub AUTOMOVE crossing
	gosub AUTOMOVE 396

FAIL-05:
     if "$zoneid" = "8" then gosub AUTOMOVE crossing
	gosub AUTOMOVE 396
	goto CLIMB-06

CLIMB-06:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-06
	pause 0.5
	put climb break
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-06
	if "$zoneid" = "8" then goto PASS-06

PASS-06:
	gosub AUTOMOVE crossing
	gosub AUTOMOVE 396
	goto CLIMB-07

FAIL-06:
	goto CLIMB-07

CLIMB-07:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-07
	pause 0.5
	if ($Athletics.Ranks <= 400) then 
          {
               send app emb quick
               pause 2
          }
     pause
	send climb embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-07
	if "$zoneid" = "8" then goto PASS-07

PASS-07:
	gosub AUTOMOVE crossing
	goto TRAVEL-08

FAIL-07:
	goto TRAVEL-08

TRAVEL-08:
	gosub AUTOMOVE 399

CLIMB-08:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-08
	pause 0.5
	put climb embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-08
	if "$zoneid" = "4" then goto PASS-08

PASS-08:
	goto CLIMB-09

FAIL-08:
	gosub AUTOMOVE 121
	gosub AUTOMOVE W gate
	gosub AUTOMOVE 2
	goto CLIMB-09

CLIMB-09:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-09
	pause 0.5
	put climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "4" then goto FAIL-09
	if "$zoneid" = "1" then goto PASS-09

PASS-09:
	gosub AUTOMOVE 398
	goto CLIMB-10

FAIL-09:
	gosub AUTOMOVE crossing
	gosub AUTOMOVE 398
	goto CLIMB-10

CLIMB-10:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-10
	pause 0.5
	put climb embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-10
	if "$zoneid" = "4" then goto PASS-10

PASS-10:
	gosub AUTOMOVE crossing
	gosub AUTOMOVE 400

FAIL-10:
	gosub AUTOMOVE 400
	goto CLIMB-11

CLIMB-11:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-11
	pause 0.5
	put climb break
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-11
	if "$zoneid" = "4" then goto PASS-11

PASS-11:
	gosub AUTOMOVE Crossing
	gosub AUTOMOVE 400
	goto CLIMB-12

FAIL-11:
	pause
	goto CLIMB-12

CLIMB-12:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-12
	pause 0.5
	put climb embrasure
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "1" then goto FAIL-12
	if "$zoneid" = "4" then goto PASS-12

PASS-12:
	goto CLIMB-13

FAIL-12:
	gosub AUTOMOVE 121
	gosub AUTOMOVE w gate
	gosub AUTOMOVE 221
	goto CLIMB-13

CLIMB-13:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-13
	pause 0.5
	put climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "4" then goto FAIL-13
	if "$zoneid" = "1" then goto PASS-13

PASS-13:
	gosub AUTOMOVE 121
	gosub AUTOMOVE w gate
	gosub AUTOMOVE 220
	goto CLIMB-14

FAIL-13:
	gosub AUTOMOVE 220
	goto CLIMB-14

CLIMB-14:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-14
	pause 0.5
	send climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "4" then goto FAIL-14
	if "$zoneid" = "1" then goto PASS-14

PASS-14:
	gosub AUTOMOVE 121
	gosub AUTOMOVE w gate
	goto CLIMB-15

FAIL-14:
	gosub AUTOMOVE 1
	goto CLIMB-15

CLIMB-15:
     if $Athletics.LearningRate > 33 then goto endearly
	if ($stamina < 50) then gosub FATIGUE_WAIT
	SAVE FAIL-15
	pause 0.5
	put climb wall
	pause 0.3
     pause 0.5
     pause 0.5
	if "$zoneid" = "4" then goto FAIL-15
	if "$zoneid" = "1" then goto PASS-15

PASS-15:
	gosub AUTOMOVE 42
	goto TRAVEL-15

FAIL-15:
	gosub AUTOMOVE crossing
	goto TRAVEL-15

TRAVEL-15:
     pause 0.5
     gosub AUTOMOVE 42
     goto CLIMB.EXP

WTF.WAIT:
     echo
     echo *** YOU ARE GOING TOO FAST!
     echo *** ADD A FEW APPRAISALS IN TO BREAK UP YOUR CLIMBING
     echo 
     pause 6
     goto %s

FATIGUE_WAIT:
     echo
     echo *** PAUSING TO RESTORE FATIGUE... ***
     echo
     if ($stamina >= 95) then return
     pause 5
     goto FATIGUE_WAIT

CLIMB_PRACTICE:
     var object $0
     matchre RETURN ^The climb is too difficult|^This climb is too difficult|^You finish practicing your climbing
     put climb practice %object
     matchwait 100
     return
#======================
 
stand:
	if ($standing = 0) then put stand
	if ($standing = 0) then put dance
     pause 0.2
	return

FALLEN:
	pause 0.2
	matchre STOOD You stand|You are already standing
	matchre FALLEN cannot manage to stand|The weight of all your possessions
	matchre FALLEN ^\.\.\.wait|^Sorry, you may only type
	put stand
	matchwait

STOOD:
     pause 0.2
	goto %s

QUIT:
	echo 
	echo *** DONE! ***
	echo
	pause 0.5
	echo
	echo
	put #echo >Log Lime *** Climbed Xing walls %c times to $Athletics.LearningRate / 34***
	put #parse DONE CLIMBING
	put #parse DONE CLIMBING!
	put #parse CLIMBING DONE
	put #parse CLIMBING LOCKED
	pause 0.5
	put glance
     exit

RETREAT:
     put ret
     put ret
     pause
     goto %S

RETURN:
     pause 0.1
     RETURN

move:
 var move.direction $0
moving:
     pause 0.001
     pause 0.1
     matchre stand.then.move ^You must be standing to do that\.|^You can't do that while lying down\.|^Stand up first\.
     matchre pause.then.move %retry.command.triggers|^\.\.\.wait
     matchre retreat.from.melee.then.move ^You are engaged to .+ melee range\!|^You try to move, but you're engaged\.
     matchre retreat.from.pole.then.move ^You are engaged to .+ at pole weapon range\!|^While in combat\?  You'll have better luck if you first retreat\.
     matchre move.return ^Obvious
     matchre move.error ^You can't go there\.|^You can't swim in that direction\.
     put %move.direction
     matchwait
stand.then.move:
     gosub stand
     goto moving
pause.then.move:
     pause 0.2
     goto moving
retreat.from.melee.then.move:
     put retreat
retreat.from.pole.then.move:
     gosub stand
     put retreat
     goto moving
move.error:
     echo * Bad move direction, will try next command in 1 second. *
     pause 0.5
     put look
     return
move.return:
     return
 
AUTOMOVE:
     delay 0.0001
     var Destination $0
     var automovefailCounter 0
     if (!$standing) then gosub AUTOMOVE_STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     delay 0.0001
     pause 0.1
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     put #goto %Destination
     matchwait
AUTOMOVE_STAND:
     pause 0.1
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait
AUTOMOVE_FAILED:
     evalmath automovefailCounter (automovefailCounter + 1)
     if (%automovefailCounter > 5) then goto AUTOMOVE_FAIL_BAIL
     send #mapper reset
     pause 0.5
     pause 0.1
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     exit
AUTOMOVE_RETURN:
     pause 0.1
     return
	
 endearly:
 pause 1
 if $zoneid = 1 then
 {
 goto quit
 }
 if $zoneid = 8 then
 {
 put #goto cross
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 6 then
 {
 put #goto 23
 waitfor YOU HAVE ARRIVED
 put #goto 42
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 4 then
 {
 put #goto 14
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 if $zoneid = 3 then
 {
 put #goto 15
 waitfor YOU HAVE ARRIVED
 goto quit
 }
 goto quit