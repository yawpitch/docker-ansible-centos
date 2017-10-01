FROM centos:6
LABEL maintainer="Michael Morehouse (yawpitch)"

# Install Ansible and other requirements.
RUN yum makecache fast \
 && yum -y install deltarpm epel-release initscripts \
 && yum -y update \
 && yum -y install \
      ansible \
      sudo \
      which \
 && yum clean all

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible && echo "[local]\nlocalhost" > /etc/ansible/hosts

# Set initial cmd
CMD ["/sbin/init"]
