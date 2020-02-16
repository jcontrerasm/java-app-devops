## ------------------------------------- ENVIRONMENT -------------------------------------

# General

APP            ?= java-app-devops
TAG            ?= $(BUILD_NUMBER).0.0
USER_SERVER    ?= jc
PATH_SERVER    ?= /home/$(USER_SERVER)/jenkins/jenkins_home/workspace/build

## ------------------------------------- TASK ------------------------------------------

# Build
build:
	docker run --rm -v /root/.m2:/root/.m2            \
	-v $(PATH_SERVER):/app -w /app maven:3-alpine     \
	mvn -B -DskipTests clean package               && \
	docker build -t $(APP):$(TAG) .

# Test
test:
	docker run --rm -v /root/.m2:/root/.m2                  \
	-v $(PATH_SERVER):/app -w /app maven:3-alpine mvn test
