EMACS = emacs
CASK = ~/.cask/bin/cask

CASKEMACS = $(CASK) exec $(EMACS)
LOAD-ORGMODE = -L org-mode/lisp

# http://stackoverflow.com/questions/3931741/why-does-make-think-the-target-is-up-to-date
.PHONY: install build test clean

all: install build test clean

# install dependencies
install:
	$(CASK) install

build:
	$(CASK) build

test:
	$(CASKEMACS) -batch ${LOAD-ORGMODE} --eval="(message (concat \"Org version: \" (org-version) \" on Emacs version: \" (emacs-version)))"
	$(CASK) exec ert-runner ${LOAD-ORGMODE}
clean:
	$(CASK) clean-elc
