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

RUN npm --registry https://registry.npm.taobao.org install -g wstunnel \
    && sed -i '10 wstunnel -s 0.0.0.0:80 &' /wechaty/bin/entrypoint.sh

EXPOSE 25000 80 443