set talk off

* Syntax
* getHiddenStr(X, Y, "<Prompt text>")

* Examples: 
* getHiddenStr(10,10, "Enter new password: ")
* ?getHiddenStr(40,40, "Re-enter password: ")
* mypassword = getHiddenStr(10,12, "Enter password: ")

* Illustration:
? getHiddenStr(20,20, "Enter password: ")


function getHiddenStr

    PARAMETER X, Y, dispStr
    
    CLEAR
    
    pswd  = ''
    stars = ''
    
    DO WHILE .T.
        
        @ X,Y CLEAR
        
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
            case READKEY() = 12 && Escape was pressed
            	WAIT WINDOW " cancelling function " NOWAIT
            	EXIT   
            case READKEY() = 15 and LASTKEY() != 32
                EXIT
            
        ENDCASE
        
    ENDDO
    
RETURN pswd

set talk on
