#!/bin/sh
# Re-apply local patches to vendored submodules. Idempotent: safe to run on
# every config load. A submodule checkout/update resets the plugin working
# tree, so this restores local changes that are not upstreamed.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

apply_patch() {
	sub="$ROOT/$1"
	patch="$ROOT/patches/$2"
	# reverse-check succeeds when the patch is already applied -> skip
	git -C "$sub" apply --reverse --check "$patch" 2>/dev/null && return 0
	git -C "$sub" apply "$patch" 2>/dev/null
}

apply_patch plugins/tmux-easymotion easymotion-dim-background.patch
