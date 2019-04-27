set talk off
set date british

clear 

s=0
z=0

* storing numbers to variables to work in input ( numeric data type )

exit = 0
store 1 to about
clear = 2
ascii = 3
    
sd= 4 && sum of digits
    
help = 5
pie=22/7
ttime=0


* database user check 

USE DATABASE
clear

ACCEPT "Enter your name : " to named

LOCATE for DATABASE.NAME= named

IF named == ALLTRIM(DATABASE.NAME)
    
    passwordd = getHiddenStr(10,10,"Enter your password: ")

    IF passwordd == ALLTRIM(DATABASE.PASSWORD)
        clear

        * initial time calculation
        timei = time()
        timehi = substr(timei,1,2)
        timemi = substr(timei,4,2)
        timesi = substr(timei,7,2)
        ttimei = val(timehi)*3600+val(timemi)*60+val(timesi)

        * main screen header
        ?" You are logged in as : ",DATABASE.NAME,"       at",timei," on ", date()
        ?" "
        ?" Welcome to calc1, a prototype calculator developed in FoxPro 2.5, inspired by"
        ?" the Free Software Foundation's command line  'bc calculator'."
        ?"--------------------------------------------------------------------------------"

        do oprat
        * the entire program exits after executing oprat

    ELSE
        ?"You have entered incorrect password."
        ?"    Contact your system admin." 
        
    ENDIF

ELSE
    ? "You are not registered!"
    ?"================================================================================"
    ? " " 
    ? " "

    ACCEPT "Register yourself with us [y/n] : " to resp
    
    IF resp = "y"
        
        append blank
        ACCEPT "Please enter your name : " to nm

        newp = getHiddenStr(10, 10, "Set password: ")
        
        
        IF LEN(newp) >= 8
            repl name with nm, password with newp

            tries = 0

            DO WHILE tries < 3

                confp = getHiddenStr(10,10, "Confirm your password : ")
                
                IF confp = alltrim(DATABASE.password)
                    wait window "You are registered." nowait
                    delete for name = space(20)
                    pack
                    close all
                    EXIT
                ELSE
                    tries = tries + 1
                    WAIT [" Password did not match !! try again !! "]
                ENDIF

                delete for name = space(20)
                pack
               
            ENDDO
            
        ELSE
            ? "Your password must atleast 8 characters long!"
            ? "Please try again."
        
        ENDIF
        
        close all
    
    ENDIF

ENDIF

* Password entry routine
* Example
* mypassword = getHiddenStr(10,12, "Enter password: ")
function getHiddenStr

    PARAMETER X, Y, dispStr
    
    CLEAR
    
    pswd  = ''
    stars = ''
    
    DO WHILE .T.
        
        ch = ''
        
        @ X,Y SAY dispStr
        @ X,Y+LEN(dispStr) SAY stars GET ch SIZE 1,1 PICT "x" RANGE [' ', '~']
        READ
        
        DO CASE
            case READKEY() = 271
                pswd  = pswd + ch
                stars = stars + '*'
            case LASTKEY() = 32
            	pswd  = pswd + ' '
            	stars = stars + '*'
            case READKEY() = 0
                pswd  = STUFF(pswd , LEN(pswd) , 1, '')
                stars = STUFF(stars, LEN(stars), 1, '')
            case READKEY() = 15 and LASTKEY() != 32
                EXIT
            
        ENDCASE

        @ X,Y CLEAR
        
    ENDDO
    
RETURN pswd


set talk on