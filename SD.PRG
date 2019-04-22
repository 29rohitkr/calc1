set talk off

DO WHILE .T.
    
    INPUT "Enter num : " to n
    sumd = 0
    
    IF n != 0
        
        DO while n > 0
            sumd = sumd + (n%10)
            n = int(n/10)
        ENDDO
        
        ? "sum of digit is",sumd
    
    ELSE
        # Exits when the user enters 0
        EXIT
    
    ENDIF

ENDDO