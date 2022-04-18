FROM wechaty/wechaty:0.68
LABEL maintainer="xrsec"
LABEL mail="troy@zygd.site"
LABEL Github="https://github.com/XRSec/wechaty"
LABEL org.opencontainers.image.source="https://github.com/XRSec/wechaty"
LABEL org.opencontainers.image.title="wechaty"

# Install SSH
# RUN apt-get -qq update \
#     && apt-get -qq install openssh-server

# RUN mkdir /run/sshd
# RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config
# RUN echo root:wechaty|chpasswd \
#     && echo 'IyEvYmluL2Jhc2gKCkxPR1RJTUU9JChkYXRlICIrJVktJW0tJWQgJUg6JU06JVMiKQplY2hvICJbJExPR1RJTUVdIHN0YXJ0dXAgcnVuLi4uIiA+Pi9yb290L3NzaGQubG9nCnNlcnZpY2Ugc3NoIHN0YXJ0ID4+L3Jvb3Qvc3NoZC5sb2cKI3NlcnZpY2UgbXlzcWwgc3RhcnQgPj4vcm9vdC9zc2hkLmxvZw==' | base64 -d > /root/sshd.sh \
#     && echo 'IyBzdGFydHVwIHJ1bgppZiBbIC1mIC9yb290L3NzaGQuc2ggXTsgdGhlbgogICAgICAvcm9vdC9zc2hkLnNoCmZp' | base64 -d >> /root/.bashrc \
#     && chmod +x /root/sshd.sh

# RUN apt-get -qq update \
#     && apt-get -qq install wget unzip \
#     && wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz \
#     && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz \
#     && echo 'export PATH="$PATH:/usr/local/go/bin"' >> /root/.bashrc \
#     && wget https://github.com/chasonnchen/wechat_bot/archive/refs/heads/main.zip \
#     && mv wechat_bot-main/ /gowechat \
#     && rm go1.18.1.linux-amd64.tar.gz main.zip \
#     && sed -i "s/\"127.0.0.1:30009\"/os.Getenv(\"WECHATY_PUPPET_ENDPOINT\")/g" /gowechat/main.go \
#     && sed -i "s/\"2fdb00a5-5c31-4018-84ac-c64e5f995057\"/os.Getenv(\"WECHATY_PUPPET_TOKEN\")/g" /gowechat/main.go


EXPOSE 25000

ENTRYPOINT  [ "/wechaty/bin/entrypoint.sh" ]