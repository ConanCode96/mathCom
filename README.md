# MathCom
> __A compiler for nested multi mathematical operations (Addition, Subtraction, multiplication, division, exponentiation)__

### Milestones
- [X] added Lexer file (compiled with [GNU::Flex](https://www.gnu.org/software/flex/))
- [X] added Parser file (compiled with [GNU::Bison](https://www.gnu.org/software/bison/))
- [X] edited grammar production rules (now operations have the right precedence and associativity)
- [x] added support for floating point operations
- [x] added hexadecimal support
- [ ] parentheses precedence adjustment
- [ ] __3__ unknown shift/reduce conflicts from GNU::Bison

### Steps to reproduce
  1. ``` flex lexer.l ```
  2. ``` bison -d parser.y ```
  3. ``` gcc lex.yy.c parser.tab.c -o bin.exe ```
  4. ``` bin.exe < input.txt ``` or just ```bin.exe``` if you prefer to work from standard input stream
