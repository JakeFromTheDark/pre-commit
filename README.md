# pre-commit hooks

## Using `npm-groovy-lint` with pre-commit
Add this to your `.pre-commit-config.yaml` under the `repos` list:
```
  - repo: https://github.com/JakeFromTheDark/pre-commit-hooks
    rev: master
    hooks:
      - id: npm-groovy-lint
```
Requirements:
* `java`, `npm-groovy-lint`

## Using `terraform_validate` with pre-commit
Add this to your `.pre-commit-config.yaml` under the `repos` list:
```
  - repo: https://github.com/JakeFromTheDark/pre-commit-hooks
    rev: master
    hooks:
      - id: terraform_validate
```
Requirements:
* `terraform`

## Using `terraform_format` with pre-commit
Add this to your `.pre-commit-config.yaml` under the `repos` list:
```
  - repo: https://github.com/JakeFromTheDark/pre-commit-hooks
    rev: master
    hooks:
      - id: terraform_format
```
Requirements:
* `terraform`

## Using `cf-doc` with pre-commit
Add this to your `.pre-commit-config.yaml` under the `repos` list:
```
  - repo: https://github.com/JakeFromTheDark/pre-commit-hooks
    rev: master
    hooks:
      - id: cf-doc
        args: [--outputdir, cfn-doc, --format, markdown, --verbose]
```
Optinal option `--format` can have values of `json`, `markdown` or `md`, by default `markdown`. The mandatory option `--outputdir` expects a dir prefix for resulted dir tree. File paths under the output dir is the same as input files and the output files have the same names except the extensions driven by the `--format`.

Requirements:
* `cf-doc`
