# Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change.

Contribution is also welcome, and should follow the guidelines described here:

https://www.terraform-best-practices.com/

## Prerequisites

Please ensure you have the following installed before you start, to ensure that your contribution
follows the same quality standards.

* [`terraform`](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
* [`terraform-docs`](https://terraform-docs.io/)
* [`pre-commit`](https://pre-commit.com/)

Finally, install `pre-commit` into your working copy:

```
pre-commit install
```

This will ensure that hooks run before you commit.

## Pre-commit

When you commit the following installed and configured hooks will run:
* terraform-docs
* terraform fmt

### Commit Process with pre-commit
1. If any files were modified during the `pre-commit` (normally by terraform-docs and terraform fmt) it will exit and you can review any changes made to the files. 
    - If you need to manually run `pre-commit`:
      ```
      pre-commit run --all-files
      ```
2. Once you review the files you can run your commit again. 
3. If you need to bypass any of the validations performed by `pre-commit` to push your changes use the `--no-verify` option:
    ```
    git commit --no-verify -m "some commit notes"  
    ```
4. Once all issues are fixed you can push your changes as you would normally do.

## Pull Request Process

1. Fork the project.
2. Start a feature branch based on the `main` branch (`git checkout -b <feature-name> main`).
3. Update the README.md with details of changes including example hcl blocks and [example files](./examples) if appropriate.
4. Commit and push your changes.
5. Issue a pull request and wait for your code to be reviewed.

## Checklists for contributions

- [ ] Add [semantics prefix](#semantic-pull-requests) to your PR or Commits (at least one of your commit groups)
- [ ] README.md has been updated.

## Semantic Pull Requests

To generate changelog, Pull Requests or Commits must have semantic and must follow conventional specs below:

- `feat:` for new features
- `fix:` for bug fixes
- `improvement:` for enhancements
- `docs:` for documentation and examples
- `refactor:` for code refactoring
- `test:` for tests
- `ci:` for CI purpose
- `chore:` for chores stuff

The `chore` prefix skipped during changelog generation. It can be used for `chore: update changelog` commit message by example.
