# Get image from Dockerhub.
FROM janerva/samplicator

# Run samplicator
ENTRYPOINT [ "/opt/samplicate-run.sh" ]
