BASE_FOLDER ?= $(shell bash -c 'pwd')  # Base repo Folder
LABS_FOLDER ?= "labs"                  # Relative to the BASE_FOLDER, where the md files are located

default: labs tests

provision:
	# Prepare env to launch the labs
	hack/provision

build: clean
	# Create bash files with MDSH to be tested
	hack/build ${LABS_FOLDER}

tests:
	# Execute tests files over Metal3 environment
	#hack/tests ${TARGET}
	echo "TO-DO"

clean:
	@echo "cleaning build folder"
	@rm -rf build env

.PHONY: labs clean tests
