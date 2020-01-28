MARP = marp --html


build: node_modules index.md
	$(MARP) index.md


watch:
	$(MARP) --watch index.md


clean:
	rm -f index.html


node_modules:
	npm install
