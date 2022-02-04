FROM python:3.9-slim-buster
RUN apt update \
 && python -m pip install --upgrade pip \
 && pip install napalm \
 && pip install ansible \
 && pip install napalm-aos \
 && pip install napalm-ansible \
 && apt install git -y \
 && mkdir /home/work \
 && mkdir /etc/ansible \
 && touch /etc/ansible/ansible.cfg \
 && touch /etc/ansible/hosts \
 && git clone https://github.com/alenterprise/ansible_napalm.git /home/work 

RUN echo "[defaults]\nlibrary = /usr/local/lib/python3.9/site-packages/napalm_ansible/modules\naction_plugins = /usr/local/lib/python3.9/site-packages/napalm_ansible/plugins/action\ninventory = /home/work/hosts\ninterpreter_python = /usr/local/bin/python3" >> /etc/ansible/ansible.cfg
