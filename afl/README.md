## Build Instructions

- To build on *nix machines, run in current directory.

```bash
make
```
- To build the instrumenting compiler, run in `llvm_mode`
 
```
cd llvm_mode
make
cd ..
```

**You are required to have clang-3.8.0 or above installed on your machine**

## Testing
### Compile Testing Software
Use the `afl-clang-fast` and `afl-clang-fast++` to compile the testing software.
Here is a simple example to compile an insertion-sort program.
```
./afl-clang-fast insertion-sort.c -o isort
```
For other cases like Markdown compilers, you might need to modify the Makefile to specify the compilers.

### Run the Tool
See AFL for more instruction about the command line options. Here is the corresponding command for testing insertion-sort.
```
./afl-fuzz -p -i isort-seeds -o out/ -N 64 ./isort @@
```
### Results
Results are presented in the ```queue``` directory of the ouput directory (e.g., `out/`).
