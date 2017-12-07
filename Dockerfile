FROM cptactionhank/netatalk:latest
MAINTAINER Will Gulian "https://github.com/Pear0"

ARG user=tmroot
ARG password

RUN groupadd -g1000 tmroot
RUN useradd --no-create-home -u1000 -g100 -G users tmroot
RUN echo "$user:${password:-MySecretPassword}" | chpasswd

COPY ./afp.conf /etc/afp.conf

