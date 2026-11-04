CC = gcc
CFLAGS = -g

OBJ12 = lab1/Pr1/Code_2.o lab1/Pr1/arr_io.o lab1/Pr1/arr_process.o
OBJ13 = lab1/Pr1/Code_3.o lab1/Pr1/arr_io.o lab1/Pr1/arr_process.o
STAGES1 = lab1/Pr1/Code_1.i lab1/Pr1/Code_1.s lab1/Pr1/Code_1.o
OPT1 = lab1/Pr1/task1_O0.s lab1/Pr1/task1_O1.s lab1/Pr1/task1_O2.s lab1/Pr1/task1_O3.s
OBJ22 = lab2/main2.2.o lab2/lib_for_lab2.o
OBJ3 = lab3/main3.o lab3/load.o

.PHONY: all clean stages1 opt1 prog11 prog12 prog13 prog12lib prog13lib prog21 prog22 prog23 prog3

all: stages1 opt1 prog11 prog12 prog13 prog12lib prog13lib prog21 prog22 prog23 prog3

# короткие имена
stages1: $(STAGES1)
opt1: $(OPT1)
prog11: lab1/Pr1/Code_1.exe
prog12: lab1/Pr1/prog_2.exe
prog13: lab1/Pr1/prog_3.exe
prog12lib: lab1/Pr1/prog_2_lib.exe
prog13lib: lab1/Pr1/prog_3_lib.exe
prog21: lab2/main2.1.exe
prog22: lab2/main2.2.exe
prog23: lab2/main2.3.exe
prog3: lab3/main3.exe lab3/array.dll lab3/matrix.dll

clean:
	-del lab1\Pr1\*.i lab1\Pr1\*.s lab1\Pr1\*.o lab1\Pr1\*.a lab1\Pr1\*.exe
	-del lab2\*.o lab2\*.a lab2\*.exe
	-del lab3\*.o lab3\*.exe lab3\*.dll

# лабораторная 1, часть 1
lab1/Pr1/Code_1.i: lab1/Pr1/Code_1.c
	$(CC) -E -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/Code_1.s: lab1/Pr1/Code_1.c
	$(CC) -S -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/Code_1.o: lab1/Pr1/Code_1.c
	$(CC) -c -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/Code_1.exe: lab1/Pr1/Code_1.o
	$(CC) -o $@ lab1/Pr1/Code_1.o

# разные уровни оптимизации
lab1/Pr1/task1_O0.s: lab1/Pr1/Code_1.c
	$(CC) -S -O0 -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/task1_O1.s: lab1/Pr1/Code_1.c
	$(CC) -S -O1 -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/task1_O2.s: lab1/Pr1/Code_1.c
	$(CC) -S -O2 -o $@ lab1/Pr1/Code_1.c

lab1/Pr1/task1_O3.s: lab1/Pr1/Code_1.c
	$(CC) -S -O3 -o $@ lab1/Pr1/Code_1.c

# лабораторная 1, часть 2 
lab1/Pr1/arr_io.o: lab1/Pr1/arr_io.c
	$(CC) $(CFLAGS) -c lab1/Pr1/arr_io.c -o $@

lab1/Pr1/arr_process.o: lab1/Pr1/arr_process.c
	$(CC) $(CFLAGS) -c lab1/Pr1/arr_process.c -o $@

lab1/Pr1/Code_2.o: lab1/Pr1/Code_2.c lab1/Pr1/arr_utils.h
	$(CC) $(CFLAGS) -c lab1/Pr1/Code_2.c -o $@

lab1/Pr1/Code_3.o: lab1/Pr1/Code_3.c lab1/Pr1/arr_utils.h
	$(CC) $(CFLAGS) -c lab1/Pr1/Code_3.c -o $@

lab1/Pr1/prog_2.exe: $(OBJ12)
	$(CC) $(CFLAGS) -o $@ $(OBJ12)

lab1/Pr1/prog_3.exe: $(OBJ13)
	$(CC) $(CFLAGS) -o $@ $(OBJ13)

lab1/Pr1/libarray.a: lab1/Pr1/arr_io.o lab1/Pr1/arr_process.o
	ar crs $@ lab1/Pr1/arr_io.o lab1/Pr1/arr_process.o

lab1/Pr1/prog_2_lib.exe: lab1/Pr1/Code_2.o lab1/Pr1/libarray.a
	$(CC) $(CFLAGS) -o $@ lab1/Pr1/Code_2.o -Llab1/Pr1 -larray

lab1/Pr1/prog_3_lib.exe: lab1/Pr1/Code_3.o lab1/Pr1/libarray.a
	$(CC) $(CFLAGS) -o $@ lab1/Pr1/Code_3.o -Llab1/Pr1 -larray

# лабораторная 2 
# программа 1
lab2/main2.1.o: lab2/main2.1.c
	$(CC) $(CFLAGS) -c lab2/main2.1.c -o $@

lab2/main2.1.exe: lab2/main2.1.o
	$(CC) $(CFLAGS) -o $@ lab2/main2.1.o -lm

# общая часть: функции ввода и вывода строки
lab2/lib_for_lab2.o: lab2/lib_for_lab2.c lab2/lib_for_lab2.h
	$(CC) $(CFLAGS) -c lab2/lib_for_lab2.c -o $@

# программа 2
lab2/main2.2.o: lab2/main2.2.c lab2/lib_for_lab2.h
	$(CC) $(CFLAGS) -c lab2/main2.2.c -o $@

lab2/main2.2.exe: $(OBJ22)
	$(CC) $(CFLAGS) -o $@ $(OBJ22)

# программа 3
lab2/liblab2.a: lab2/lib_for_lab2.o
	ar crs $@ lab2/lib_for_lab2.o

lab2/main2.3.o: lab2/main2.3.c lab2/lib_for_lab2.h
	$(CC) $(CFLAGS) -c lab2/main2.3.c -o $@

lab2/main2.3.exe: lab2/main2.3.o lab2/liblab2.a
	$(CC) $(CFLAGS) -o $@ lab2/main2.3.o -Llab2 -llab2

# лабораторная 3 
lab3/array_lib.o: lab3/array_lib.c lab3/lib_api.h
	$(CC) $(CFLAGS) -c lab3/array_lib.c -o $@

lab3/array.dll: lab3/array_lib.o
	$(CC) -shared -o $@ lab3/array_lib.o

lab3/matrix_lib.o: lab3/matrix_lib.c lab3/lib_api.h
	$(CC) $(CFLAGS) -c lab3/matrix_lib.c -o $@

lab3/matrix.dll: lab3/matrix_lib.o
	$(CC) -shared -o $@ lab3/matrix_lib.o

lab3/load.o: lab3/load.c lab3/load.h
	$(CC) $(CFLAGS) -c lab3/load.c -o $@

lab3/main3.o: lab3/main3.c lab3/load.h
	$(CC) $(CFLAGS) -c lab3/main3.c -o $@

lab3/main3.exe: $(OBJ3)
	$(CC) $(CFLAGS) -o $@ $(OBJ3)