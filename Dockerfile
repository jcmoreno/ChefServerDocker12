FROM	ubuntu:14.04
MAINTAINER Juan Moreno <moreno.juan23@gmail.com>

RUN	apt-get update
ENV	DEBIAN_FRONTEND noninteractive

RUN	apt-get install -yq wget
RUN	wget --content-disposition "https://packages.chef.io/files/stable/chef-server/12.15.7/ubuntu/14.04/chef-server-core_12.15.7-1_amd64.deb"
RUN	dpkg -i chef-server*.deb

RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -sf /bin/true /sbin/initctl

ADD	. /usr/local/bin/
CMD	["run_chef_server"]

EXPOSE	443