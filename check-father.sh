#!/bin/bash
set -e

check_father() {
  local father_path="$(realpath "$1")"
  local child_path="$(realpath "$2")"

  local father_commit
  local child_commit

  # Get the HEAD commit of each repo
  father_commit=$(git -C "$father_path" rev-parse HEAD)
  child_commit=$(git -C "$child_path" rev-parse HEAD)

  echo "🔍 Checking if $father_path ($father_commit) is ancestor of $child_path ($child_commit)"

  if git -C "$child_path" merge-base --is-ancestor "$father_commit" "$child_commit"; then
    echo "✅ $1 is an ancestor of $2"
    return 0
  else
    echo "❌ $1 is NOT an ancestor of $2"
    return 1
  fi
}

echo "📋 Checking template inheritance relationships"
echo "============================================="

check_father base-template c-template
check_father base-template csharp-template
check_father base-template go-template
check_father base-template java-maven-template
check_father base-template npm-template
check_father base-template python-template
check_father base-template rust-template

check_father java-maven-template javafx-template
check_father java-maven-template springboot-template

check_father npm-template node-fastify-template

check_father npm-template angular-template
check_father npm-template vue-template

check_father npm-template electron-template

check_father python-template python-fastapi-template
