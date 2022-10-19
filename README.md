# cloud-init Lint Action

This is a GitHub action for validating cloud-init files

## Example

```yaml
name: Lint
on: [push]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps: 
    - name: Checkout
      uses: actions/checkout@master
    - name: Lint cloud-init
      uses: anderssonpeter/cloud-init-linter@v1
```

## Usage

This is a list of the arguments this action can take:

| Name  | Required | Description        | Default                      |
|-------|----------|--------------------|------------------------------|
| files | No       | What files to lint | `**/*cloud-init*.{yml,yaml}` |

