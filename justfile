##################################################
# Variables
#
open := if os() == "linux" {
  "xdg-open"
} else if os() == "macos" {
  "open"
} else {
  "start \"\" /max"
}

project_dir   := justfile_directory()
project_name  := file_stem(justfile_directory())
project_tag   := "0.2.3"

typst_version := "typst -V"
typst_github  := "https://github.com/typst/typst --tag v0.13.1"

template_dir  := join(justfile_directory(), "template")
doc_name      := "thesis"
type          := "draft"
lang          := "en"

local_dir := if os() == "macos" {
  "~/Library/Application\\ Support/typst/packages/local"
} else {
  "~/.local/share/typst/packages/local"
}

preview_dir := if os() == "macos" {
  "~/Library/Caches/typst/packages/preview"
} else {
  "~/.cache/typst/packages/preview/"
}

release_dir := if os() == "macos" {
"~/Library/Application\\ Support/typst/packages/preview"
} else {
"~/.local/share/typst/packages/preview"
}


##################################################
# COMMANDS
#
# List all commands
@default:
  just --list

# Information about the environment
@info:
  echo "Environment Informations\n------------------------\n"
  echo "    OS          : {{os()}}({{arch()}})"
  echo "    Open        : {{open}}"
  echo "    Typst       : `{{typst_version}}`"
  echo "    Projectdir  : {{project_dir}}"
  echo "    Projectname : {{project_name}}"

# install required sw
[windows]
[linux]
@install:
  echo "Install typst"
  cargo install --git {{typst_github}}

# install required sw
[macos]
@install:
  echo "Install typst"
  brew install typst

# install the template locally as local package
[linux]
[macos]
@copy-local:
  echo "Install template locally as local"
  echo "  {{local_dir}}/{{project_name}}/{{project_tag}}"
  mkdir -p {{local_dir}}/{{project_name}}/{{project_tag}}
  cp -r ./* {{local_dir}}/{{project_name}}/{{project_tag}}

# install the template locally as preview package
[linux]
[macos]
@copy-preview:
  echo "Install template locally as preview"
  echo "  {{preview_dir}}/{{project_name}}/{{project_tag}}"
  mkdir -p {{preview_dir}}/{{project_name}}/{{project_tag}}
  cp -r ./* {{preview_dir}}/{{project_name}}/{{project_tag}}
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/guide-to-thesis.pdf
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/guide-to-typst.pdf
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/sample.png
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/sample.svg
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/justfile
  rm -f {{preview_dir}}/{{project_name}}/{{project_tag}}/template/*.pdf

# install the template as release package
[linux]
[macos]
@copy-release:
  echo "Install template as release package"
  echo "  {{release_dir}}/{{project_name}}/{{project_tag}}"
  mkdir -p {{release_dir}}/{{project_name}}/{{project_tag}}
  cp -r ./* {{release_dir}}/{{project_name}}/{{project_tag}}
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/guide-to-thesis.pdf
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/guide-to-typst.pdf
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/sample.png
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/sample.svg
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/justfile
  rm -f {{release_dir}}/{{project_name}}/{{project_tag}}/template/*.pdf

# generate changelog and tag for the current release
@changelog-unreleased:
  git-cliff --unreleased --tag  {{project_tag}} -o CHANGELOG.md

# generate changelog for latest version bump only. Append to current file
@changelog-latest:
  git cliff --unreleased --tag {{project_tag}} --prepend CHANGELOG.md

# watch a typ file for continuous incremental build
watch file_name=doc_name type=type lang=lang:
  typst c {{template_dir}}/{{file_name}}.typ --input type={{type}} --input lang={{lang}}
  just open {{file_name}}
  typst w {{template_dir}}/{{file_name}}.typ --input type={{type}} --input lang={{lang}}

# open pdf
open file_name=doc_name:
  {{open}} {{template_dir}}/{{file_name}}.pdf

# build, rename and copy a typ file to a pdf
@pdf file_name=doc_name type=type lang=lang:
  echo "--------------------------------------------------"
  echo "-- Generate {{file_name}}.pdf of type {{type}} in language {{lang}}"
  echo "--"
  typst c {{template_dir}}/{{file_name}}.typ  --input type={{type}} --input lang={{lang}}
  mv {{template_dir}}/{{file_name}}.pdf {{template_dir}}/{{file_name}}-{{lang}}-{{type}}.pdf
  just clean

# build, rename and copy a typ file in all variants
@pdf-all file_name=doc_name:
  echo "--------------------------------------------------"
  echo "-- Generate all variants of {{file_name}}.pdf"
  echo "--"
  just pdf {{file_name}} draft en
  just pdf {{file_name}} final en
  just pdf {{file_name}} draft de
  just pdf {{file_name}} final de
  just pdf {{file_name}} draft fr
  just pdf {{file_name}} final fr

# cleanup intermediate files
[linux]
[macos]
@clean:
  echo "--------------------------------------------------"
  echo "-- Clean {{project_name}}"
  echo "--"
  rm lib/*.pdf || true
  rm template/metadata.pdf || true
  rm template/main/*.pdf || true
  rm template/tail/*.pdf || true

# cleanup intermediate files
[windows]
@clean:
  echo "--------------------------------------------------"
  echo "-- Clean {{project_name}}"
  echo "--"
  del /q /s lib\*.pdf 2>nul
  del /q /s template\metadata.pdf 2>nul
  del /q /s template\main\*.pdf 2>nul
  del /q /s template\tail\*.pdf 2>nul
