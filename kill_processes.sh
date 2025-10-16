#!/usr/bin/env bash

SIGNAL=15
DRY_RUN=0
if [ "$1" = "-s" ]; then
  SIGNAL=$2
  shift 2
elif [ "$1" = "--dry-run" ]; then
  DRY_RUN=1
  shift
fi
if [ -z "$1" ]; then
  echo "Usage: $0 [-s signal_number] [--dry-run] <process_name>"
  exit 1
fi
PROCESS_NAME=$1

echo "Pattern: '$PROCESS_NAME' | Signal: $SIGNAL"
PIDS=$(pgrep -f -- "$PROCESS_NAME")
if [ -z "$PIDS" ]; then
  echo "No matching processes."
  exit 0
fi
echo "PIDs: $PIDS"
if [ "$DRY_RUN" -eq 1 ]; then
  echo "[DRY-RUN] Would kill: $PIDS"
  exit 0
fi

printf "Kill these? (y/N) "
read ans
case "$ans" in
  [Yy]*) ;;
  *) echo "Aborted."; exit 0 ;;
esac

kill -"$SIGNAL" $PIDS && \
  echo "Signal $SIGNAL sent." || \
  { echo "Error sending signal." >&2; exit 1; }
