# pandoc-compose

Create and run a fully configured pandoc command.

## installation

pandoc-compose is available via pypi, so just run

```bash
pip3 install pandoc-compose 
``` 

## dependencies

Besides declared dependencies within `setup.py`, this tool relies on [jgm's pandoc](https://pandoc.org).

## usage

In order to setup pandoc calls, create a `pandoc-compose.yaml` file, i.e.:

```yaml
f: markdown
output: document.pdf
number-sections: true
# Other pandoc options here

files:
- *.md
```

Except for files, the key, value - pairs in the yaml directly correspond to pandoc's options.

Keys of length 1 are converted to options with one minus.
In the example above, `f: markdown` is converted to `-f markdown`.

Keys of larger length are converted to options with two minuses.
In the example above, `output: document.pdf` is converted to `--output document.pdf`

Flags are defined with boolean values.
Note that flags defined as `false` will produce no option, hence lead to the same result as they weren't defined in the first place.
