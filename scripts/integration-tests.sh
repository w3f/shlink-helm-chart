#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...

    wait_pod_ready shlink
    wait_pod_ready shlink-mariadb
}

teardown() {
    helmfile delete --purge
}

main(){
    source /scripts/build-helmfile.sh

    run_tests
}

main
