FROM openjdk

RUN set -xe && \
	mkdir -p /allure && \
	curl -sL https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline/2.13.1/allure-commandline-2.13.1.tgz | \
	tar -xz -C /allure --strip-components=1 && \
	ln -s /allure/bin/allure /usr/bin/allure

VOLUME /report /result

CMD [ "/allure/bin/allure", "serve", "--port", "80", "/report" ]