# Ubuntu
FROM ubuntu:20.04

# Environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV W2P_PORT 8000
ENV W2P_IP 0.0.0.0

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y python2.7 wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Web2py
WORKDIR .

RUN wget http://www.web2py.com/examples/static/web2py_src.zip && \
    unzip web2py_src.zip && \
    rm web2py_src.zip

# Expose the Web2py port
EXPOSE $W2P_PORT

# Copy the Local Folder to Docker
#COPY testWeb2App web2py/applications/testWeb2App


# Start Web2py
CMD python2.7 web2py/web2py.py -a 'your_admin_password' -i $W2P_IP -p $W2P_PORT
