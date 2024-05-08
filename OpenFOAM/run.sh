#!/bin/bash

if [[ $EESSI_CVMFS_REPO == "/cvmfs/software.eessi.io" ]] && [[ $EESSI_VERSION == "2023.06" ]]; then
    echo "Running demo for OpenFOAM v11 ..."
    export OMPI_MCA_rmaps_base_oversubscribe=true
    ./bike_OpenFOAM_v11.sh
elif [[ $EESSI_CVMFS_REPO == "/cvmfs/pilot.eessi-hpc.org" ]] && [[ $EESSI_PILOT_VERSION == "2021.12" ]]; then
    echo "Running demo for OpenFOAM v8 ..."
    export OMPI_MCA_rmaps_base_oversubscribe=true
    ./bike_OpenFOAM_v8.sh
elif [[ $EESSI_CVMFS_REPO == "/cvmfs/pilot.eessi-hpc.org" ]] && [[ $EESSI_PILOT_VERSION == "2023.06" ]]; then 
    echo There is no demo for OpenFOAM in "/cvmfs/pilot.eessi-hpc.org/versions/2023.06". <&2
    echo Please use the EESSI production repo "/cvmfs/software.eessi.io".<&2
    exit 1;
else 
    echo "Don't know which OpenFOAM module to load for ${EESSI_CVMFS_REPO}/versions/${EESSI_VERSION}$EESSI_PILOT_VERSION" >&2
    exit 1
fi
