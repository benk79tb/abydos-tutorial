# FROM ubuntu:20.04
# FROM weboftrust/keri:1.1.16
# FROM gleif/keri:1.0.0
FROM benk79tb/keripy:kentbull


# Install dependencies
RUN apk --no-cache add \
    linux-headers \
    jq

COPY . /keripy/abydos-tutorial

RUN python -m pip install kaslcred==0.1.1

RUN git clone https://github.com/kentbull/sally.git && cd sally && git checkout old-agent && python3 -m pip install -e ./
RUN git clone https://github.com/WebOfTrust/vLEI.git && cd vLEI && python3 -m pip install -e ./

WORKDIR /keripy/abydos-tutorial
ENTRYPOINT [ "/bin/bash",  "./workflow.sh"]
