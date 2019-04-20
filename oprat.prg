set talk off
set date british


# calculator area starts
do while .T. 
input "$ " to x or accept to s or input to z 
if x = about
?"           **********************************************"
?"           *       made with fun in Foxpro 2.5          *"  
?"           *       name  :   calc1 v2                   *"
?"           *       developer: Rohit Kumar               *"
?"           * all tradmarks reserved to its proprietary  *"
?"           * owner and developer don't try to copy      *"
?"           *  ask me i will help                        *"
?"           **********************************************"
?"  "
?" "
?" now you can register yourself in this version and now it stores lastlogin time and"
?" date also login and logout time in userdata. "
endif
# on exit final time calculation
if x = exit
time2=time()
timehf = substr(time2,1,2)
timemf = substr(time2,4,2)
timesf = substr(time2,7,2)
ttimef =val(timehf)*3600+val(timemf)*60+val(timesf)
ttime = ttimef-ttimei 
if ttime <= 60
? "you elapsed ",ttime,"seconds"
else
if ttime > 60 and ttime < 3600
tm = int(ttime/60)
ts =  mod(ttime,60)
? "you elapsed ",tm,"min",ts,"sec"
else
if ttime >= 3600
th = int(ttime/3600)
ts = ttime%3600
if ts >= 60 and ts <= 3600
tm = int(val(ts)/60)
ts =  mod(val(ts),60)
endif
?"you elapsed",th,"hrs",tm,"min",ts,"sec" 
endif
endif
endif
# time calculation finished now exit
wait window " thanks for being with us " NOWAIT
repl laslogdate with date(),laslogtime with timei
use
use userdata
append blank
repl name with named, logdate with date(),logintime with timei ,logouttime with time2, totaltime with ttime
delete for name=space(20)
pack
close all
exit
else
# calculator operators 
do case 
case s =0+0
a = x+ z
case s =0-0
a=x-z 
case s =1*1
a = x *z 
case s = 1/1
a = x / z 
case s = 1^1
a = x^z
endcase
?">",a
endif
if x = clear
clear
# main screen 
?"you are logged in as : ",DATABASE.NAME,"at",timei," on ", date()  
?" welcome to calc1. it is a prototype calculator. it is inspired from bc calculator (free software foundation)."
?" this is calc1 developed under foxpro 2.5 environment"
?"--------------------------------------------------------------------------------"
endif
if x =ascii
? "      ascii to character converter"
do while .T. 
input "enter ascii to convert : " to ch
if ch != exit
? "the character is :",chr(ch)
else
exit
endif
enddo
endif
if x =sd
do sd
endif
if x = help
?"            type 0 or exit to exit program "
?"            type 1 or about to know more about calc1 "
?"            type 2 or clear to clear screen "
?"            type 3 or ascii to open ascii converter"  
?"            type 4 or sd to open digit adder of a number "
?"            type 5 or help for this window " 
endif
# automatic exit
time3=time()
timehf = substr(time3,1,2)
timemf = substr(time3,4,2)
timesf = substr(time3,7,2)
ttimef =val(timehf)*3600+val(timemf)*60+val(timesf)
ttime = ttimef-ttimei 
if ttime >= 3000
WAIT WINDOW "you are done" NOWAIT
exit
endif
enddo