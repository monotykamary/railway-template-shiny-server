# Dependency candidate — 2026-11-15

Keep the sample application and Shiny Server adapter unchanged; advance the consumed Rocker image from R 4.6.1 to R 4.6.2 by exact image digest. Canonical CRAN release source `https://cran.r-project.org/src/base/R-4/R-4.6.2.tar.gz` returned HTTP 200 with its release artifact metadata. Rocker's version-specific source Dockerfile sets `R_VERSION=4.6.2`; its upstream build scripts use moving installation inputs, but this wrapper consumes already-built immutable image bytes rather than rebuilding those scripts.

The boat matrix must prove sample UI/assets and real histogram recomputation using Shiny `testServer` on each lifecycle phase. The sample app is stateless. Public HTTPS/WebSocket and Railway behavior remain live gates. No live validation or publication is claimed here.
