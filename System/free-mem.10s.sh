#!/bin/bash

# Shows free mem with extra info
# Code taken from http://apple.stackexchange.com/a/48195

FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
WIRED_BLOCKS=$(vm_stat | grep wired | awk '{ print $4 }' | sed 's/\.//')
ACTIVE_BLOCKS=$(vm_stat | grep 'Pages active' | awk '{ print $3 }' | sed 's/\.//')

FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
ACTIVE=$(($ACTIVE_BLOCKS*4096/1048576))
WIRED=$(($WIRED_BLOCKS*4096/1048576))
TOTAL=$((($FREE+$INACTIVE)))
echo M $TOTAL MB
echo ---
echo Wired:      $WIRED MB
echo Active:     $ACTIVE MB
echo Inactive:   $INACTIVE MB
echo Free:       $FREE MB
echo Total free: $TOTAL MB
