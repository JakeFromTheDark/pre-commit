#!/usr/bin/env bash

output_dir=
output_format=markdown
verbose=
retcode=0

die () {
  echo "${0##*/}: $*" >&2
  exit 1
}

while [ -n "$1" ]; do
  case "$1" in

    --outputdir=*)
      output_dir="${1#*=}"
      shift
      ;;

    --outputdir)
      shift
      output_dir="$1"
      shift
      ;;

    --format=*)
      output_format="${1#*=}"
      shift
      ;;

    --format)
      shift
      output_format="$1"
      shift
      ;;

    --verbose)
      verbose=yes
      shift
      ;;

    --*)
      die "Syntax error: Unsupported option ($1)"
      ;;

    *)
      break
      ;;
  esac
done

# validate output format
case "${output_format}" in
  json)        output_extension=json;;
  markdown|md) output_extension=md;;
  *) die "Syntax error: Unsupported output format (${output_format})";;
esac

# ensure output dir
[ -n "${output_dir}" ] \
 || die "Syntax Error: No output dir given"
[ -f "${output_dir}" ] \
 && die "Syntax Error: Given output dir (${output_dir}) is a file"

# process the rest of arguments - files
for file; do
  out_file="${output_dir}/${file%.*}.${output_extension}"
  [ -n "${verbose}" ] \
    && echo "Creating ${output_format} file ${out_file} from ${file} ..."
  mkdir -p "${out_file%/*}"
  cf-doc "${output_format}" "${file}" > "${out_file}" || retcode=$?
done

exit "${retcode}"
