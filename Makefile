# Optional convenience wrappers around uv. Everything here is a one-liner:
#
#   uv sync                  # create/refresh the env (arlpy installed editable)
#   uv run python -m unittest discover -s tests -t .   # tests
#   uv build                 # sdist + wheel
#   uv publish dist/*        # needs UV_PUBLISH_TOKEN

.PHONY: test docs clean

test:
	uv run python -m unittest discover -s tests -t . -v

docs:
	uv run --group docs sphinx-build -b html docs build

clean:
	find . -name '*.pyc' -delete
	find . -name __pycache__ -type d -prune -exec rm -rf {} +
	rm -rf build dist
