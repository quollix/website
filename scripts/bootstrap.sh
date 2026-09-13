#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd "$script_dir/.." && pwd)"
temp_dir="$(mktemp -d)"
trap 'rm -rf "$temp_dir"' EXIT

sudo apt-get update
sudo apt-get install -y ca-certificates curl tar xz-utils git nodejs npm

go_version="$(curl -fsSL 'https://go.dev/VERSION?m=text' | sed -n '1p')"
go_archive="${go_version}.linux-amd64.tar.gz"
curl -fsSL "https://go.dev/dl/${go_archive}" -o "$temp_dir/$go_archive"
go_install_dir="/usr/local/lib/quollix-tools"
sudo mkdir -p "$go_install_dir"
sudo rm -rf "$go_install_dir/go"
sudo tar -C "$go_install_dir" -xzf "$temp_dir/$go_archive"
sudo ln -sf "$go_install_dir/go/bin/go" /usr/local/bin/go

hugo_version="$(curl -fsSL https://api.github.com/repos/gohugoio/hugo/releases/latest | sed -n 's/.*"tag_name": "\(v[^"]*\)".*/\1/p')"
hugo_archive="hugo_extended_${hugo_version#v}_linux-amd64.tar.gz"
curl -fsSL "https://github.com/gohugoio/hugo/releases/download/${hugo_version}/${hugo_archive}" -o "$temp_dir/$hugo_archive"
tar -xzf "$temp_dir/$hugo_archive" -C "$temp_dir"
sudo install -m 0755 "$temp_dir/hugo" /usr/local/bin/hugo

cd "$project_dir"
export PATH="/usr/local/bin:$PATH"
npm ci

node --version
go version
hugo version
