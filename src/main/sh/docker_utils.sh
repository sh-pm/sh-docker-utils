#!/bin/bash

source ../../../bootstrap.sh

include_lib sh-logger
include_lib sh-commons

docker_volume_exists() {

	local NUM_PARAMS_EXPECTED=1
	
    ensure_number_params_correct $NUM_PARAMS_EXPECTED $@

	if [[ $(docker volume list | grep $1) == "" ]]; then
    	log_trace "Docker volume $1 NOT exists."  
    	return $FALSE
    else
	    log_trace "Docker volume $1 exists."
    	return $TRUE
	fi
}

docker_image_exists() {

	local NUM_PARAMS_EXPECTED=1
	
    ensure_number_params_correct $NUM_PARAMS_EXPECTED $@

	if [[ "$(docker images -q $1 2> /dev/null)" == "" ]]; then   		
    	log_trace "Docker Image $1 NOT exists."  
    	return $FALSE
    else
	    log_trace "Docker Image $1 exists."
    	return $TRUE
	fi
}

docker_container_exists() {

	local NUM_PARAMS_EXPECTED=1
	
    ensure_number_params_correct $NUM_PARAMS_EXPECTED $@

	if [[ $(docker ps -a | grep $1) == "" ]]; then
    	log_trace "Docker container $1 NOT exists."  
    	return $FALSE
    else
	    log_trace "Docker container $1 exists."
    	return $TRUE
	fi
}

docker_container_is_stopped() {
	
	local NUM_PARAMS_EXPECTED=1
	
    ensure_number_params_correct $NUM_PARAMS_EXPECTED $@
    
	if [ ! "$(docker ps -q -f name=$1)" ]; then
    	if [ "$(docker ps -aq -f status=exited -f name=$1)" ]; then
    		log_trace "Docker container $1 stopped."
    		return $TRUE
    	fi
	fi
	log_trace "Docker container $1 running."
	return $FALSE
}

docker_network_exists() {

	local NETWORK_NAME=$1
	local NUM_PARAMS_EXPECTED=1
	
    ensure_number_params_correct $NUM_PARAMS_EXPECTED $@
	
	if [[ $(docker network list | grep "$NETWORK_NAME") == "" ]]; then
    	log_trace "Docker network $1 NOT exists."  
    	return $FALSE
	else
		log_trace "Docker network exists."
		return $TRUE
	fi	
}