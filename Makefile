DOCKERIMGNAME=webdriverio
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME) --build

# Docker Related Commands
dockerbuild:
	docker build -t webdriverio .
dockertag:
	docker tag webdriverio you54f/webdriverio
dockerpush:
	docker push you54f/webdriverio:latest
dockerremovelocal:
	docker rmi webdriverio
dockerremoveremote:
	docker rmi you54f/webdriverio

install:
	 yarn install

docker-install:
	 $(DOCKERRUNCMD) yarn install


# Test Related Commands
build:
	 yarn run build
pretest:
	 yarn run clean-build
clean:
	 yarn run clean

# Test Related Commands
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
# Test Related Commands
test-local:
	 yarn run test-local
test-sauce:
	 yarn run test-sauce
test-browserstack:
	 yarn run test-browserstack
test-testingbot:
	 yarn run test-testingbot
