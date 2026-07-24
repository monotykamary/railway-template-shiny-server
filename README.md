# Shiny Server on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/shiny-server?referralCode=ZqgrJ0)

A production-ready Railway template for hosting interactive R applications with the open-source Shiny Server. It uses the maintained `rocker/shiny:4.6.1` image and includes a reactive sample application.

## Deploy

Deploy the published template from Railway, or deploy this repository directly:

```bash
railway up
```

Shiny Server reads Railway's `PORT` variable at startup. Application logs are forwarded to the Railway log stream.

## Use your own Shiny application

Replace [`app/app.R`](app/app.R) with your application. For a multi-file application, copy `ui.R`, `server.R`, modules, and static assets into `app/`.

Install additional R packages in the Dockerfile before copying the application:

```dockerfile
RUN install2.r --error --skipinstalled \
    bslib \
    dplyr \
    ggplot2
```

Pin package versions or use a lockfile for reproducible production applications.

## Configuration

| Variable | Default | Purpose |
| --- | --- | --- |
| `PORT` | `3838` | Port used by Shiny Server. Railway routes the public domain to this port. |
| `APPLICATION_LOGS_TO_STDOUT` | `true` | Streams individual Shiny application logs into Railway logs. |

## Local development

```bash
docker build -t shiny-server-railway .
docker run --rm -p 3838:3838 -e PORT=3838 shiny-server-railway
```

Open <http://localhost:3838>.

## Architecture

The template contains one stateless Shiny Server service. Add a Railway volume only if your application writes durable local files. For shared or relational state, connect a database or object-storage bucket instead.

## License

The template glue and sample application are MIT licensed. Shiny, Shiny Server, R, and Rocker retain their respective upstream licenses and trademarks.
