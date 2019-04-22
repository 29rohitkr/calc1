set talk off
set date british


# calculator area starts

do while .T. 

    input "$ " to x or accept to s or input to z 
    
    IF x = about
        
        ?"           **********************************************"
        ?"           *       made with fun in Foxpro 2.5          *"  
        ?"           *       name     : calc1 v2                  *"
        ?"           *       developer: Rohit Kumar               *"
        ?"           * All tradmarks reserved to its proprietary  *"
        ?"           * owner and developers don't try to copy.    *"
        ?"           * Ask me i will help                         *"
        ?"           **********************************************"
        ?" "
        ?" "
        ?" You can now register yourself in this version. It stores your last login time"
        ?" and date and also your logout time in userdata."
    
    ENDIF
    

# on exit final time calculation
    
    if x = exit
        
        # Calculating the time elapsed since last login
        
        time2 = time()      
        timehf = substr(time2,1,2)
        timemf = substr(time2,4,2)
        timesf = substr(time2,7,2)
        ttimef = val(timehf)*3600+val(timemf)*60+val(timesf)
        ttime = ttimef-ttimei 
        
        if ttime <= 60
            ? "You elapsed ",ttime,"seconds"
        
        else
            
            if ttime > 60 and ttime < 3600
                tm = int(ttime/60)
                ts = int(mod(ttime,60))
                ? "You elapsed ",tm,"min",ts,"sec"
            
            else
                
                if ttime >= 3600
                    
                    th = int(ttime/3600)
                    ts = ttime % 3600
                    
                    if ts >= 60 and ts <= 3600
                        tm = int(val(ts)/60)
                        ts =  int(mod(val(ts),60))
                    endif
                    
                    ?"You elapsed",th,"hrs",tm,"min",ts,"sec" 
                
                endif
            
            endif
        
        endif
    
        # time calculation finished now exit
    
        wait window "Thanks for being with us." NOWAIT
    
        repl laslogdate with date(),laslogtime with timei
    
        #comments required for these
        use
        use userdata
        append blank
        repl name with named, logdate with date(),logintime with timei ,logouttime with time2, totaltime with ttime
        delete for name = space(20)
        pack
        close all
        
        exit
        
    else
        # calculator operators 
        
        do case 
            
            case s = 0 + 0
                a = x + z
            
            case s = 0 - 0
                a = x - z 
            
            case s = 1 * 1
                a = x * z 
            
            case s = 1 / 1
                a = x / z 
            
            case s = 1 ^ 1
                a = x ^ z
        
        endcase
        
        ?">",a
    
    endif

    if x = clear
    
        clear
        # main screen
        ?" You are logged in as : ",DATABASE.NAME,"       at",timei," on ", date()
        ?" "
        ?" Welcome to calc1, a prototype calculator developed in FoxPro 2.5, inspired by"
        ?" the Free Software Foundation's command line  'bc calculator'."
        ?"--------------------------------------------------------------------------------"
    
    endif

    if x = ascii
        ?"      Converter: ASCII <--> character"
        ?" "
    
        do while .T.
        
            input "Enter ASCII to convert : " to ch
        
            if ch != exit
                ? "The character is :",chr(ch)
            else
                EXIT
            endif
    
        enddo

    endif
    
    if x = sd
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

    time3 = time()
    
    timehf = substr(time3,1,2)
    timemf = substr(time3,4,2)
    timesf = substr(time3,7,2)
    
    ttimef = val(timehf) * 3600 + val(timemf) * 60 + val(timesf)
    ttime = ttimef - ttimei 
    
    if ttime >= 3000
        WAIT WINDOW "You are done!" NOWAIT
        EXIT
    endif

enddo