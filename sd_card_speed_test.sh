#!/bin/bash
# Created by Alexander aka BioDranik <me@alex.bio> in Minsk, Belarus

set -eu

if [ $# -lt 1 ]; then
  echo "Usage: $0 <path_to_directory_where_to_test_read_and_write_speed>"
  exit 1
fi

SD_DIR=$1
FILENAME="$SD_DIR/file_speed_test.deleteme"
SIZE=1000 # in MB
# SIZE=100 # in MB


write_file() {
  echo -n "Average write speed: "
  dd if=/dev/zero of=$FILENAME bs=1M count=$SIZE oflag=direct 2>&1 | tail -n 1 | sed -E 's|^.* ([0-9.,]+ .B\/s)$|\1|'
}

read_file() {
  echo -n "Average read speed: "
  dd if=$FILENAME of=/dev/null bs=1M iflag=direct 2>&1 | tail -n 1 | sed -E 's|^.* ([0-9.,]+ .B\/s)$|\1|'
}

write_file
trap "rm $FILENAME" 0
read_file

