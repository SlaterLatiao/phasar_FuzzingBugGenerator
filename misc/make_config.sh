#!/bin/bash

# author: Philipp D. Schubert
#
# This scripts determines the compiler information and
# standard header includes paths and places them in two
# configuration files that are placed in the config/ directory.

ConfigDir=config/
CompilerInfoFile=compiler_info.txt
StdHeaderPathFile=standard_header_paths.conf

echo -e "int main() { return 0; }" | clang++ -x c++ -v - -o /dev/null &> ${CompilerInfoFile}
cat ${CompilerInfoFile} | tr -d '\n' | sed -e 's/.*#include <\.\.\.> search starts here: \(.*\)End of search list\..*/\1/' | tr ' ' '\n' > ${StdHeaderPathFile}
mv ${CompilerInfoFile} ../${ConfigDir}
mv ${StdHeaderPathFile} ../${ConfigDir}