FROM resin/rpi-raspbian as builder

MAINTAINER Alexander Bubeck <alexander.bubeck@zuehlke.com>

WORKDIR /work/

RUN ["cross-build-start"]

RUN apt-get update && apt-get install build-essential

COPY . /work/

RUN cd rt-tests && make cyclictest

RUN objdump -f /work/rt-tests/cyclictest

RUN ["cross-build-end"]



FROM resin/rpi-raspbian 

MAINTAINER Alexander Bubeck <alexander.bubeck@zuehlke.com>

RUN apt-get -q update \
	&& apt-get -qy install \
		iputils-ping \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root/
COPY --from=builder /work/rt-tests/cyclictest .
COPY load.sh .
