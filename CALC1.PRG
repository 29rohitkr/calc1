
set talk off
set date british
clear 
s=0
z=0
# storing no to variables to work in input ( numeric data type )
exit = 0
store 1 to about
clear = 2
ascii = 3
# sum of digits = sd
sd= 4
help = 5
pie=22/7
ttime=0
#
# database user check 
USE DATABASE
clear
accept "Enter your name : " to named 
LOCATE for DATABASE.NAME= named
if named == ALLTRIM(DATABASE.NAME)
accept  "Enter your password :" to passwordd
if passwordd == ALLTRIM(DATABASE.PASSWORD)
clear
# initial time calculation
timei = time()
timehi = substr(timei,1,2)
timemi = substr(timei,4,2)
timesi = substr(timei,7,2)
ttimei = val(timehi)*3600+val(timemi)*60+val(timesi)
# main screen 
?"you are logged in as : ",DATABASE.NAME,"at",timei," on ", date()  
?" welcome to calc1. it is a prototype calculator. it is inspired from bc calculator (free software foundation)."
?" this is calc1 developed under foxpro 2.5 environment"
?"--------------------------------------------------------------------------------"
do oprat
else
? "you have entered an incorrect password"
? " contact your system admin" 
endif
else
? "you are not registered "
?"================================================================================"
? " " 
? " "

accept "Register yourself with us [y/n] : " to regis
if regis = "y"
append blank
accept "enter your name : " to nm

? "set a password : " 
accept to pas
p =len(pas)
if p >= 8
for j = 1 to p
pd ="*"
?? pd
endfor
repl name with nm,password with pas
t=0
do while t < 3
? " confirm your password : " 
accept to pass
p =len(pass)
for j = 1 to p
pd ="*"
?? pd
endfor
if pass = alltrim(DATABASE.password)
wait window " you are registered " nowait
delete for name=space(20)
pack
close all
exit
else 
t=t+1
? "you entered an incorrect password "
? " //////////  try again \\\\\\\\\\\\\"
endif
delete for name=space(20)
pack
enddo
else
?" your password must 8 character long "
? " try again and enter password"
endif
close all
endif
endif
set talk on
