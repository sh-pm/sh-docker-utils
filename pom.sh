GROUP_ID=bash
ARTIFACT_ID=sh-docker-utils
VERSION=v1.3.1

declare -A REPOSITORY=( \
	[host]="shpmcenter.com" \
	[port]=443 \
);

declare -A DEPENDENCIES=( \
    [sh-pm]=v3.3.0
    [sh-logger]=v1.4.0 \
    [sh-unit]=v1.5.4 \
	[sh-commons]=v2.2.1 \
);

SSO_API_AUTHENTICATION_URL=https://shpmcenter.com/sso/rest/api/sso/authentication