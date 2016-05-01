#!/usr/bin/env bats

load tests-helper

## Test to ensure BATS itself is working

@test "Confirm BATS is working properly" {
	result="$(echo 2+2 | bc)"
	[ "$result" -eq 4 ]
}

## Test local folder write permission
@test "Test local folder write permission" {
	local TEST_FILE='test_file'
	touch "$TEST_FILE"
	echo "content" > "$TEST_FILE"

	rm -f "$TEST_FILE"
	ls -lh
	echo $?
	echo "${status}"
	[ "$status" -eq 0 ]
}

## Test compile_linux_kernel

# Test Sourcing of Files
@test "Source colors.sh" {
	source "${BATS_TEST_DIRNAME}/colors.sh"
	[ "$?" -eq 0 ]
}

@test "Source variables.sh" {
	source "${BATS_TEST_DIRNAME}/compile_variables.sh"
	[ "$?" -eq 0 ]
}

@test "Source functions.sh" {
	source "${BATS_TEST_DIRNAME}/functions.sh"
	[ "$?" -eq 0 ]
}


