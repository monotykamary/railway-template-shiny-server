# Deploy and Host Shiny Server with Railway

Shiny Server hosts interactive web applications written in R. This template deploys the open-source server on a pinned Rocker image with a working reactive application, Railway-aware port configuration, application logs on stdout, and an HTTP health check.

## About Hosting Shiny Server

Hosting Shiny Server turns R analyses, visualizations, and data tools into browser-based applications. Railway builds the included Dockerfile, assigns a public HTTPS domain, monitors the root application, and restarts the service after runtime failures. The repository includes a sample histogram application so every deployment can be validated immediately. Replace the files in `app/` with your own Shiny application and add any required R packages to the Dockerfile.

## Common Use Cases

- Publish interactive R dashboards and reports
- Build internal data exploration and decision-support tools
- Share statistical models through browser-based interfaces
- Prototype reactive visualizations without a JavaScript frontend
- Host educational demonstrations and research applications

## Dependencies for Shiny Server Hosting

- R 4.6.1
- Shiny and Shiny Server Open Source
- The maintained `rocker/shiny:4.6.1` container image
- Docker for reproducible application packaging

### Deployment Dependencies

- [Shiny documentation](https://shiny.posit.co/)
- [Shiny Server repository](https://github.com/rstudio/shiny-server)
- [Rocker versioned images](https://github.com/rocker-org/rocker-versioned2)
- [Template source repository](https://github.com/monotykamary/railway-template-shiny-server)

### Implementation Details

The startup wrapper validates Railway's `PORT`, writes it into the Shiny Server configuration, and then launches the upstream Rocker init system. Shiny application logs are streamed to stdout. The service is stateless by default and does not require a database or volume.

### Why Deploy Shiny Server on Railway?

Railway provides source builds, HTTPS networking, deployment health checks, logs, and restart management around Shiny Server. This keeps the template small while leaving the application code and R package selection fully customizable in GitHub.
