GROUP_ID=bash
ARTIFACT_ID=sh-docker-utils
VERSION=v1.4.0

declare -A DEPENDENCIES=( \
    [sh-pm]=v4.0.0@github.com/sh-pm \
    [sh-logger]=v1.4.0@github.com/sh-pm \
    [sh-unit]=v1.5.4@github.com/sh-pm \
	[sh-commons]=v2.2.3@github.com/sh-pm \
);