DOCKERIMGNAME=webdriverio
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME)

# Docker Related Commands
dockerbuild:
	docker build -t webdriverio ./Dockerfile
dockertag:
	docker tag webdriverio you54f/webdriverio
dockerpush:
	docker push you54f/webdriverio:$CIRCLE_BRANCH
dockerremovelocal:
	docker rmi webdriverio
dockerremoveremote:
	docker rmi you54f/webdriverio

# Test Related Commands
install:
	 cd src && yarn install
build:
	 cd src && yarn run build
pretest:
	 cd src && yarn run clean-build
clean:
	 cd src && yarn run clean

# Test Related Commands
test-local:
	 cd src && yarn run test-local
test-sauce:
	 cd src && yarn run test-sauce
test-browserstack:
	 cd src && yarn run test-browserstack
test-testingbot:
	 cd src && yarn run test-testingbot

# Test Related Commands
docker-install:
	 $(DOCKERRUNCMD) yarn install
docker-build:
	$(DOCKERRUNCMD) yarn run build
docker-pretest:
	$(DOCKERRUNCMD) yarn run clean-build
docker-clean:
	$(DOCKERRUNCMD) yarn run clean

# Test Related Commands
docker-test-local:
	$(DOCKERRUNCMD) yarn run test-local
docker-test-sauce:
	$(DOCKERRUNCMD) yarn run test-sauce
docker-test-browserstack:
	$(DOCKERRUNCMD) yarn run test-browserstack
docker-test-testingbot:
	$(DOCKERRUNCMD) yarn run test-testingbot
