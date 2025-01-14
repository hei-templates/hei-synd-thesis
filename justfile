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

typst_version := "typst -V"
typst_github  := "https://github.com/typst/typst typst-cli --tag v0.12.0"

output_dir    := "05-pdf"
doc_name      := "main"

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

# watch a typ file for continuous incremental build
watch file_name=doc_name:
  typst w {{file_name}}.typ

# open pdf
open file_name=doc_name:
  {{open}} {{file_name}}.pdf

# build, rename and copy a typ file to a pdf
@pdf file_name=doc_name:
  echo "--------------------------------------------------"
  echo "-- Generate {{file_name}}.pdf"
  echo "--"
  typst c {{file_name}}.typ
  mkdir -p {{output_dir}}
  mv {{file_name}}.pdf "{{output_dir}}/{{project_name}}.pdf"
  just clean

# build, rename and copy a typ file in all variants
@pdf-all file_name=doc_name:
  echo "--------------------------------------------------"
  echo "-- Generate all variants of {{file_name}}.pdf"
  echo "--"
  just pdf {{file_name}}

# cleanup intermediate files
[linux]
[macos]
@clean:
  echo "--------------------------------------------------"
  echo "-- Clean {{project_name}}"
  echo "--"
  rm 00-templates/*.pdf || true
  rm 01-settings/*.pdf || true
  rm 02-main/**/*.pdf || true
  rm 03-tail/*.pdf || true
  rm 04-resources/*.pdf || true

# cleanup intermediate files
[windows]
@clean:
  echo "--------------------------------------------------"
  echo "-- Clean {{project_name}}"
  echo "--"
  del /q /s 00-templates\*.pdf 2>nul
  del /q /s 01-settings\*.pdf 2>nul
  del /q /s 02-main\**\*.pdf 2>nul
  del /q /s 03-tail\*.pdf 2>nul
  del /q /s 04-resources\*.pdf 2>nul
