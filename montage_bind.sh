#!/bin/bash
GIT_ROOT="/root/batts/github/se3richelieu/clients-linux/"
REAL_ROOT="/home/netlogon/clients-linux/"

mount --bind "${GIT_ROOT}/unefois/" "${REAL_ROOT}/unefois"
mount --bind "${GIT_ROOT}/bin/" "${REAL_ROOT}/bin"
mount --bind "${GIT_ROOT}/divers/" "${REAL_ROOT}/divers"
