echo "Assemble the triangle module"
gcc -c -Wall -m64 -no-pie -std=c11 -o triangle.o triangle.c 

echo "Assemble the area module"
nasm -g -F dwarf -f elf64 -o area.o area.asm 

echo "Assemble isfloat module"
g++ -c -Wall -m64 -std=c++14 -no-pie -o isfloat.o isfloat.cpp


echo "Linking files"
gcc -m64 -no-pie -std=c11 -o exec.out triangle.o area.o isfloat.o  

echo "---------------------------------------------"
./exec.out