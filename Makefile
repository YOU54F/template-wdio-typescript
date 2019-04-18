DOCKERIMGNAME=webdriverio
DOCKERRUNCMD=docker-compose run --rm $(DOCKERIMGNAME)

# Docker Related Commands
dockerbuild:
	docker build . -t webdriverio
dockertag:
	docker tag webdriverio you54f/webdriverio
dockerpush:
	docker push you54f/webdriverio:latest
dockerremovelocal:
	docker rmi webdriverio
dockerremoveremote:
	docker rmi you54f/webdriverio

# Test Related Commands
build:
	$(DOCKERRUNCMD) yarn run build
pretest:
	$(DOCKERRUNCMD) yarn run clean-build
clean:
	$(DOCKERRUNCMD) yarn run clean

# Test Related Commands
test-local:
	$(DOCKERRUNCMD) yarn run test-local
test-sauce:
	$(DOCKERRUNCMD) yarn run test-sauce
test-browserstack:
	$(DOCKERRUNCMD) yarn run test-browserstack
test-testingbot:
	$(DOCKERRUNCMD) yarn run test-testingbot
