# Python-Scientific Docker image

A docker image providing a modern environment for the scientific python
programming I do.

It is entirely Python 3 and provides the most recent versions of common
Python scientific programming and data science packages. OK, I know,
not all of you who do scientific python do data science, but I can
assure you, these packages can become handy very quickly.

## Packages included (in alphabetical order)

- jupyter
- matplotlib
- numpy
- pandas
- scikit-learn
- scipy

## Building

```
docker build -t python-scientific .
```

## Usage

```
docker run python-scientific your-command
```

which will usually be

```
docker run python-scientific python3 something
```

There is a data directory for scripts and stuff. Of course one can map
local directories to it. To map the current working directory to the
``/data`` directory and run your stuff,

```
docker run -v $(pwd):/data python3 something
```

By default, the container spins up a Jupyter notebook.

```
docker run -p 8888:8888 python-scientific
```

without any further command is thus eqivalent to

```
docker run -p 8888:8888 python-scientific /usr/local/bin/jupyter notebook --no-browser --ip=0.0.0.0 --notebook-dir=/data
```

In the following, I'll explain the Jupyter notebook arguments

- ``--no-browser`` Jupyter would otherwise try to open the installed
  browser, but in the container obviously there is none.
- ``--ip=0.0.0.0`` Listen to any IP address, since we do not know the
  container's address beforehand
- ``--notebook-dir=/data`` to have the notebooks stored in the ``/data``
  directory instead of the file system root

