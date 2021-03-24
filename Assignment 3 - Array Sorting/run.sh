echo "Assemble the read_clock module"
nasm -f elf64 -o read_clock.o read_clock.asm

echo "Assemble the manager module"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the Input_Array module" 
nasm -f elf64 -o Input_Array.o Input_Array.asm

echo "Assemble the atol module"
nasm -f elf64 -o atol.o atol.asm

echo "Assemble the swap module"
nasm -f elf64 -o swap.o swap.asm 

echo "Compile the main module"
gcc -c -Wall -m64 -std=c11 -no-pie -o main.o main.c

echo "Compile the bubble_sort module"
gcc -c -Wall -m64 -std=c11 -no-pie -o bubble_sort.o bubble_sort.c

echo "Compile the Display_Array module"
g++ -c -Wall -m64 -std=c++14 -no-pie -o Display_Array.o Display_Array.cpp

echo "Compile the validate-decimal-digits module"
g++ -c -Wall -m64 -std=c++14 -no-pie -o validate-decimal-digits.o validate-decimal-digits.cpp

echo "Link the object files"
gcc -m64 -no-pie -std=c11 -o exec.out manager.o main.o Input_Array.o Display_Array.o validate-decimal-digits.o atol.o read_clock.o bubble_sort.o swap.o

echo " "
./exec.out