CC=gcc

TARGET = linux-scalability

MYFLAGS =  -g -O0 -Wall -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free
MYLIBS = libmtmm.a



all: $(TARGET) $(MYLIBS) 


libmtmm.a: mtmm.c
	$(CC) $(MYFLAGS) -c mtmm.c
	ar rcu libmtmm.a mtmm.o 
	ranlib libmtmm.a


$(TARGET): $(TARGET).c libmtmm.a
	$(CC) $(CCFLAGS) $(MYFLAGS) $(TARGET).c libmtmm.a -o $(TARGET) -lpthread -lm

#bct: $(MYLIBS)
#	gcc -g -O0 -Wall -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free  libmtmm.a   
clean:
	rm -f $(TARGET)  *.o  libmtmm.a 

