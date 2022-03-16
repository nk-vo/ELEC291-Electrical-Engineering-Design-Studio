# Since we are compiling in windows, select 'cmd' as the default shell.  This
# is important because make will search the path for a linux/unix like shell
# and if it finds it will use it instead.  This is the case when cygwin is
# installed.  That results in commands like 'del' and echo that don't work.
SHELL=cmd
CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=AT89LP51Rx2_Receiver.obj

AT89LP51Rx2_Receiver.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
AT89LP51Rx2_Receiver.obj: AT89LP51Rx2_Receiver.c
	$(CC) -c AT89LP51Rx2_Receiver.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	..\Pro89lp\Pro89lp -p -v AT89LP51Rx2_Receiver.hex
	cmd /c start putty -serial $(COMPORT) -sercfg 115200,8,n,1,N

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	cmd /c start putty -serial $(COMPORT) -sercfg 115200,8,n,1,N
	
Dummy: AT89LP51Rx2_Receiver.hex AT89LP51Rx2_Receiver.Map
	@echo Nothing to see here!
	
explorer:
	cmd /c start .

		