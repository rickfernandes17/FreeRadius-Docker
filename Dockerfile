FROM freeradius/freeradius-server:latest


# Install the mysql package
RUN apt-get update && apt-get install -y freeradius-mysql && rm -rf /var/lib/apt/lists/*

COPY raddb/ /etc/raddb/

RUN ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql && \
    chown -R freerad:freerad /etc/raddb/
