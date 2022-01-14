# Miller docker container

This is a repo that contains the code for a docker container with bgen and qctool2 binaries.

## Installation

To install the container, run the following using docker:

```bash
docker pull befh/bgen
```

or the following with singularity:

```bash
singularity pull --name bgen.img docker://befh/bgen:latest
```

To use with Snakemake, you do not need to install. Just put the following in the Snakefile:

```
container: 'docker://befh/bgen:latest'
```

Then run with `snakemake --use-singularity` see https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html for more info.

## Usage

To run with docker, `docker run bgen [ARGS]`.

To run with singularity, `singularity run bgen.img [ARGS]`.


