<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# A template to use as a starting point for integrating mongoDB into a Shiny dashboard.

This R package is based on a template developed by NHS Business Services Authority Data Analytics Learning Lab to use as a template for building NHSBSA branded R `{shiny}` dashboards. 

## Features

We have used the `{golem}` framework to develop this taking inspiration from:

* [Example `golem` apps](https://github.com/ThinkR-open/golem)
* [Clinical Development Unit Data Science Team dashboards](https://github.com/CDU-data-science-team)

It includes two dummy modules demonstrating using either markdown or `{highcharter}` with an NHSBSA theme applied. 

Also included is a sample `data-raw/` script. Since much of the data used in NHSBSA dashboards can be sensitive, the `data/` directory can be included in the `.gitignore` (you can change this if some sensitive data is included) and this means you must run all the `data-raw/` scripts to produce the `data/` files after cloning.

There is also a github action to check that code conforms to tidyverse linting.

## Structure

The package is structured as follows:

```
nhsbsaShinyR
├── .github                                 # Workflows for github actions
├── R                                       # R code for the dashboard
│   ├── _disable_autoload.R                 # Golem file
│   ├── app_config.R                        # Golem file
│   ├── app_server.R                        # Server component
│   ├── app_ui.R                            # UI component
│   ├── golem_*.R                           # Golem file
│   ├── mod_*.R                             # Module 
│   ├── run_app.R                           # Golem file
│   ├── utils_helpers.R                     # Custom NHSBSA highcharter theme
│   └── utils-pipe.R                        # %>% operator
├── data-raw                                # Various scripts to produce `data` files
├── data                                    # Data for the dashboard (accessible via mongo2shiny::{name})
├── dev                                     # Golem files
│   ├── 01_start.R                          # Golem file (use to set up golem framework)
│   ├── 02_dev.R                            # Golem file (use to develop package)
│   ├── 03_deploy.R                         # Golem file (use to deploy package)
│   └── run_dev.R                           # Golem file (use to test development of package)
├── inst                                    # Installed files...
│   ├── app                                 # ... for the app...
│   │   └── www                             # ... made available at runtime
│   │       ├── colours.css                 # Define colour palette of NHS identity
│   │       ├── logo.jpg                    # NHS logo
│   │       ├── mod_*.md                    # Markdown text for module
│   │       └── style.css                   # CSS to defining the styling of the dashboard
│   └── golem-config.yml                    # Golem file
├── .Rbuildignore                           # Golem file
├── .gitignore                              # Currently ignoring all `data` files
├── DESCRIPTION                             # Metadata of package
├── LICENSE                                 # Apache
├── NAMESPACE                               # Automatically generated documentation by roxygen2
├── README.md                               # Brief overview of the package
├── app.R                                   # Golem file
├── mongo2shiny.Rproj                       # R Project file
```
