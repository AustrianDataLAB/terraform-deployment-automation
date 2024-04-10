# Start from the empty container image
FROM scratch

# Copy the static executable
COPY hello /hello

# Run the binary
CMD ["/hello"]
