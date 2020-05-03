# pre-commit hooks

## Using npm-groovy-lint with pre-commit
Add this to your `.pre-commit-config.yaml` under the `repos` list:
```
  - repo: https://github.com/JakeFromTheDark/pre-commit-hooks
    rev: master
    hooks:
      - id: npm-groovy-lint
```
Requirements:
* installed `npm`, `java`
* installed `npm-groovy-lint` binary in the PATH
