set talk off
exit = 0
do while .T.
input "enter num : " to n
t = 0
if n != exit
do while n>0
r= N%10
t= t+r
n = int(n/10)
enddo
? "sum of digit is",t
else 
exit
endif
enddo