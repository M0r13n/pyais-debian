# pyais-debian

Debian package for the [pyais](https://github.com/M0r13n/pyais) project.

Get the upstream pyais repository source code:

`make pull-sources`

Build the package:

`make`

Now the built packages are available in **./output/**.

The **.deb** can then be installed using apt (`-f` tells apt to install required dependencies):

`apt install -f ./output/pyais_2.5.6_amd64.deb `

## Project Layout

The project uses [pybuild](https://wiki.debian.org/Python/Pybuild) as its build system for Python packages.

The following volumes are bind-mounted into the container:

- ./sources --> /source-ro/
- ./output --> /output/
- ./buildhelper.sh --> /buildhelper.sh

Inside the container the contents of **/source-ro/** are copied into **/build/source**, in which `dpkg-buildpackage` builds the package. This will write the built packages into the parent folder **/build/**, from which they are copied to **/output**. The latter is bind-mounted to share the files between container and host.
