all: llsim
llsim: llsim.c llsim.h sp.c
	gcc -Wall -o llsim -O2 -pthread llsim.c sp.c
clean:
	\rm -f llsim *~

