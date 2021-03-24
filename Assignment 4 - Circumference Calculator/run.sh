echo "Assembling circumference module"
gcc -c -Wall -m64 -no-pie -std=c11 -o circumference.o circumference.c

echo "Assembling circle module"
nasm -f elf64 -o circle.o circle.asm 

echo "Linking files"
gcc -m64 -no-pie -std=c11 -o exec.out circumference.o circle.o 

echo " "
./exec.out