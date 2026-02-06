
# Dockerfile for Secure Container with Shell Script - By Santiago Bernardez
# Builds a minimal container to run a security check script.
# Trade-off: Minimal Alpine image for security (small size, low attack surface) vs Ubuntu for more tools (easier but larger).

# Minimal Image for Security
FROM alpine:3.18  

# Add non-root user for security (trade-off: Safer vs root for simplicity)
RUN addgroup -S appgroup -g 1000 && adduser -S appuser -u 1000 -G appgroup

# Copy the shell script into the container
COPY quick_file_check.sh /app/quick_file_check.sh

# Make the script executable and set ownership
RUN chown appuser:appgroup /app/quick_file_check.sh && chmod +x /app/quick_file_check.sh

# Switch to non-root user for security
USER 1000

# Run the script when container starts (with argument example)
CMD ["/app/quick_file_check.sh", "/some/file.txt"] # Replace with your argument if needed

# Lessons: Used Alpine for lightweight security. Trade-off: Minimal vs full-featured (less dependencies but harder to debug).
