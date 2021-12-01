# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

function cpwd() (
	pwd | tr / _
)

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|vendor' --dirsfirst "$@" | less -FRNX;
}

function new_local_python() (
	if [ $# -eq 0 ]
	then
		pyenv virtualenv 3.8.6 $(pwd | tr / _)
		pyenv local $(pwd | tr / _)
	else
		pyenv virtualenv 3.8.6 $@
		pyenv local $@
	fi;
	pip install -U pip
	pyenv versions
)

function lint() {
	if [ $# -eq 0 ]
	then
		echo 'Linting modified models...'
		sqlfluff lint $(git diff origin/main --name-only | grep -E '(^snowflake_dbt/models.*[.]sql$)' | sed 's/snowflake_dbt\///g') --exclude-rules L009
	else
		# if [ $1 == "a" ] || [$1 == "all" ]
		# then
		# 	echo "Linting all models..."
			# sqlfluff lint
		# else
		echo "Linting models: $@"
		sqlfluff lint $@ --exclude-rules L009
		# fi;
	fi;
}

function transform_query() {
	echo "\nValidating configs..."
	mql validate-configs --config-dir .
	echo "\nCommitting configs..."
	mql commit-configs --config-dir . --pin true
	echo "\nQuerying metric: $@..."
	mql query --metrics $@ --dimensions ds --limit 10 --order -ds
	echo "\nUnpinning model..."
	mql unpin-model
}
