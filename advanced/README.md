# Advanced Percy + Capybara

Exercises the full applicable Percy SDK feature surface for `percy-capybara`. 9 RSpec examples in `spec/todomvc_advanced_spec.rb`.

## Run locally

```bash
cd advanced
make install
export PERCY_TOKEN="<your project token>"
make test
```

CI assertion mode:

```bash
make test-advanced-ci
```

Source of truth: [`matrix.yml`](./matrix.yml).
