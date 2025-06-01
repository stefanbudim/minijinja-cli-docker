# Stage 1: Build minijinja-cli
FROM rust:slim-bookworm as builder

WORKDIR /app

# Install minijinja-cli directly using cargo
RUN cargo install minijinja-cli --root /usr/local

# Stage 2: Create the final, minimal image
# Use alpine image for the smallest possible size (or use scratch and link statically)
FROM alpine:latest

# Set environment variable for minijinja-cli installation directory
ENV PATH="/usr/local/bin:$PATH"

# Copy the built binary from the builder stage
COPY --from=builder /usr/local/bin/minijinja-cli /usr/local/bin/minijinja-cli

# Define the default command to run when the container starts
ENTRYPOINT ["minijinja-cli"]
CMD ["--help"]