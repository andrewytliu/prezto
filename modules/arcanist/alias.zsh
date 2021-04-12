function _git_upstream() {
    git rev-parse --abbrev-ref --symbolic-full-name @{u}
}

function _git_downstream() {
	local branch=$(git branch --show-current)
	git for-each-ref --format='%(upstream:short) %(refname:short)' refs/heads/ | awk "\$1 == \"${branch}\" {print \$2}"
}

function gfu() {
	local upstream=$(_git_upstream)
	git checkout $upstream
}

function gfd() {
	local downstream=$(_git_downstream)
	git checkout $downstream
}

function ard() {
	local upstream=$(_git_upstream)
	arc diff $upstream $@
}

function arl() {
	arc land
}

function gfix() {
	branch=$(git symbolic-ref HEAD)
	branch_status=$?

	if [ $branch_status -ne 0 ]; then
		echo "Git branch is not found!"
		return 1
	fi

	git rebase --onto HEAD $branch@{1}
}