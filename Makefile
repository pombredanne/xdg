NAME = xdg

lint:
	mypy --ignore-missing-imports $(NAME).py
	flake8 $(NAME).py
	pylint -r n -s n $(NAME).py

format:
	yapf -i $(NAME).py

upload: lint
	python setup.py sdist bdist_wheel
	twine upload -s dist/*

clean:
	$(RM) -r $(wildcard *.egg-info *.pyc) build dist

.PHONY: clean format lint upload
