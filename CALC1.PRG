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


# database user check 

USE DATABASE
clear

ACCEPT "Enter your name : " to named

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

        # main screen header
            ?" You are logged in as : ",DATABASE.NAME,"       at",timei," on ", date()
            ?" "
            ?" Welcome to calc1, a prototype calculator developed in FoxPro 2.5, inspired by"
            ?" the Free Software Foundation's command line  'bc calculator'."
            ?"--------------------------------------------------------------------------------"

        do oprat
        # the entire program exits after executing oprat

    else
        ?"You have entered incorrect password."
        ?"    Contact your system admin." 
        
    endif

else
    ? "You are not registered!"
    ?"================================================================================"
    ? " " 
    ? " "

    ACCEPT "Register yourself with us [y/n] : " to regis
    
    if regis = "y"
        
        append blank
        accept "Please enter your name : " to nm

        ? "Set a password : " 
        accept to pas
        p = len(pas)
        
        if p >= 8
            
            for j = 1 to p
                pd ="*"
                ?? pd
            endfor
            
            repl name with nm,password with pas
            
            t = 0
            
            do while t < 3
                
                ? " confirm your password : " 
                accept to pass
                p = len(pass)
                
                for j = 1 to p
                    pd = "*"
                    ?? pd
                endfor
                
                if pass = alltrim(DATABASE.password)
                    wait window " You are registered " nowait
                    delete for name=space(20)
                    pack
                    close all
                    exit
                else 
                    t = t + 1
                    ? "   You entered an incorrect password "
                    ? " //////////  try again  \\\\\\\\\\\\\ "
                endif

                delete for name = space(20)
                pack
               
            enddo
            
        else
            ?" Your password must atleast 8 characters long "
            ? "Please try again."
        
        endif
        
        close all
    
    endif

endif

set talk on