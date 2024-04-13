# Use Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive dialogues during the build
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install the necessary packages
# * make: Required for running make commands
# * texlive-xetex: XeTeX is a TeX typesetting engine that supports Unicode and modern font technologies
# * fonts-font-awesome: Font Awesome fonts for icons in documents
# * git: Git for version control
RUN apt update &&\
    apt install -f -y \
    make \
    texlive-xetex \
    fonts-font-awesome \
    git