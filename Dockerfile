# Use Red Hat UBI 8 for OpenShift compatibility
FROM docker://registry.access.redhat.com

# Define build context
WORKDIR /workspace
COPY . .

# Execute your 'Buildpack' logic
# bin/build handles component packaging inside the image
RUN chmod +x bin/detect bin/build && ./bin/detect && ./bin/build

# Standard Ab Initio Entrypoint
ENTRYPOINT ["/bin/ksh", "/workspace/bin/sample_etl.ksh"]
