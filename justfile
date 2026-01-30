alias i := install
alias fmt := format

# For reproducibility, we set the date to 01 January 1980 while testing
date := "315532800"

# thumbnail-file := "./tests/examples/assignment/test.typ"

install target="local": clean
	./scripts/package.sh "{{target}}"

package target *options: clean
	./scripts/package.sh "{{target}}" {{options}}

set-version version *options:
	./scripts/set-version.sh "{{version}}" {{options}}

format:
	typstyle --inplace .

check-format:
	typstyle --check .

clean:
	./scripts/cleanup-artifacts.sh

# thumbnail: install
# 	typst compile --format png --pages 1 "{{thumbnail-file}}" ./thumbnail.png
