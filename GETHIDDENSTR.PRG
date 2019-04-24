set talk off

* Syntax
* getHiddenString("<Prompt text>")
* Illustration
? getHiddenString("Enter password: ")


function getHiddenString

    PARAMETER dispStr
    
    CLEAR
    
    ? dispStr
    
    pswd  = ''
    stars = ''
    
    DO WHILE .T.
        
        @ 10,10 CLEAR
        
        ch = ''
        
        @10,10 SAY stars GET ch SIZE 1,1 PICT "x" RANGE [' ', '~']
        READ
        
        DO CASE
            case READKEY() = 271
                pswd  = pswd + ch
                stars = stars + '*'
            case READKEY() = 0
                pswd  = STUFF(pswd, LEN(pswd), 1, '')
                stars = STUFF(stars, 1, 1, '')
            case READKEY() = 15
        		EXIT
        ENDCASE
    
    ENDDO
    
RETURN pswd

set talk on