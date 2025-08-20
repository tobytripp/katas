FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    gnat \
    gprbuild \
    make \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/AdaCore/aunit.git /tmp/aunit \
    && cd /tmp/aunit \
    && make \
    && make install \
    && cd / && rm -rf /tmp/aunit

WORKDIR /app

COPY ada_project.gpr test_project.gpr ./
COPY src/ src/
COPY tests/ tests/

RUN mkdir -p bin obj obj/tests \
    && gprbuild -P ada_project.gpr \
    && gprbuild -P test_project.gpr

CMD ["./bin/main"]