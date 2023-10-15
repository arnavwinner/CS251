## Follow the instructions below for the running of code.

1. Find the directory where the following files are present: asg2.l, asg2.y, correct.txt, incorrect.txt, a.out.
2. correct.txt contains valid PASCAL code & incorrect.txt contains invalid PASCAL code. We would test them using the bison generated parser.
3. Run the files using: "./a.out <file name>".
___________________________________________________________________________________________________________________________________


## Commands to follow:

The following commands can be executed in the terminal which are used to generate the parser on the given input files.

1. `flex assignment2.l`: Using Flex tool to generate lexical analyser
2. `bison -d assignment2.y`: Using Bison to generate parser
3. `gcc assignment2.tab.c -ll`: Compile C code generated by Bison
4. `./a.out <File Name>`: <File Name> is the input file name which would be parsed by the executable file generated by gcc command above.

## References

1. https://www.tutorialspoint.com/pascal/pascal_program_structure.htm for sample .pas codes to test the validation on the generated parser.
2. https://www.ibm.com/docs/en/zos/2.2.0?topic=rpsce-pascal-example Pascal references from IBM.
3. https://en.wikipedia.org/wiki/Pascal_(programming_language) for deep understanding of lexical and syntax analysis of Pascal codes.