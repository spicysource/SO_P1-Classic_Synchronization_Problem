FLAGS = -pthread -std=c++11 -Wall -Werror
CPP = g++

main: main.o mailbox.o table.o philosopher.o
	$(CPP) $(FLAGS) -o main main.o mailbox.o table.o philosopher.o

main.o: main.cpp table.h
	$(CPP) -c $(FLAGS) -o main.o main.cpp

mailbox.o: mailbox.cpp mailbox.h
	$(CPP) -c $(FLAGS) -o mailbox.o mailbox.cpp

table.o: table.cpp table.h mailbox.h philosopher.h spinlock.h
	$(CPP) -c $(FLAGS) -o table.o table.cpp

philosopher.o: philosopher.cpp philosopher.h mailbox.h table.h spinlock.h
	$(CPP) -c $(FLAGS) -o philosopher.o philosopher.cpp

.PHONY: clean run

run: main
	./main

clean: 
	rm main main.o mailbox.o table.o philosopher.o
