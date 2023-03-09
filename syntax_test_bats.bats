# SYNTAX TEST "Bats.sublime-syntax"

#!/usr/bin/env bats
#^^^^^^^^^^^^^^^^^^^ comment.line.number-sign

setup() {
# ^^^ meta.function.identifier entity.name.function
#    ^ meta.function.parameters punctuation.section.parameters.begin
#     ^ meta.function.parameters punctuation.section.parameters.end
#       ^ meta.function meta.compound punctuation.section.compound.begin
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}
# <- meta.function meta.compound punctuation.section.compound.end

@test "addition using bc" {
# <- keyword.declaration.function.test-block
# ^^^ keyword.declaration.function.test-block
#     ^^^^^^^^^^^^^^^^^^^ meta.string string.quoted.double
#     ^ punctuation.definition.string.begin
#                       ^ punctuation.definition.string.end
#                         ^^ meta.block.test-block
#                         ^ punctuation.section.braces.begin
  result="$(echo 2+2 | bc)"
# ^^^^^^ meta.block.test-block meta.variable variable.other.readwrite
  [ "$result" -eq 4 ]
# ^ meta.block.test-block meta.conditional support.function.test.begin
}
# <- meta.block.test-block punctuation.section.braces.end
#^ - meta.block

@test "addition using dc" {
# ^^^ keyword.declaration.function.test-block
  result="$(echo 2 2+p | dc)"
  [ "$result" -eq 4 ]
}
