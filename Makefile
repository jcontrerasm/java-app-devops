## ------------------------------------- ENVIRONMENT -------------------------------------

# General

APP                 ?= java-app-devops
USER_SERVER          = jc
PROJECT_PATH        ?= /home/$(USER_SERVER)/jenkins/jenkins_home/workspace/$(APP)
HOSTNAME             = gcr.io
PROJECT_ID           = prueba-ir-devops
TAG                 ?= $(BUILD_NUMBER).0.0
GCP_SERVICE_ACCOUNT ?= java-app-devops@prueba-ir-devops.iam.gserviceaccount.com
GCP_CREDENTIALS     ?= gcp-credentials.json
CREDENTIALS_PATH    ?= /var/credentials/$(GCP_CREDENTIALS)

## ------------------------------------- TASK ------------------------------------------

# Login
login:
	gcloud auth activate-service-account $(GCP_SERVICE_ACCOUNT) --key-file=$(CREDENTIALS_PATH)

# Build
build:
	docker run --rm -v /root/.m2:/root/.m2            \
	-v $(PROJECT_PATH):/app -w /app maven:3-alpine      \
	mvn -B -DskipTests clean package               && \
	docker build -t $(APP):$(TAG) .

# Test
test:
	docker run --rm -v /root/.m2:/root/.m2                  \
	-v $(PROJECT_PATH):/app -w /app maven:3-alpine mvn test

# Publish
publish:
	docker tag $(APP):$(TAG) $(HOSTNAME)/$(PROJECT_ID)/$(APP):$(TAG)  && \
	docker push $(HOSTNAME)/$(PROJECT_ID)/$(APP):$(TAG)
