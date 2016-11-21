mathjax:
	unzip MathJax-master.zip >/dev/null
	unzip MathJax-third-party-extensions-master.zip >/dev/null
	rsync -a Gruntfile.js MathJax-master/
	rsync -a package.json MathJax-master/
	cd MathJax-master && npm install && grunt template
	mkdir -p MathJax-master/contrib/physics/ MathJax-master/contrib/siunitx/
	rsync -a MathJax-third-party-extensions-master/physics/physics.js MathJax-master/contrib/physics/
	rsync -a MathJax-third-party-extensions-master/siunitx/siunitx.js MathJax-master/contrib/siunitx/
	rm -rf MathJax-master/node_modules/
	rm -f MathJax-master/.travis.yml MathJax-master/Gruntfile.js
	sed -i \
		-e 's/^MathJax\.Hub\.Config({$$/MathJax\.Ajax\.config\.path\["Contrib"\] = "mathjax\/contrib";MathJax\.Hub\.Config({/' \
		-e 's/extensions: \['\''\[Contrib\]\/a11y\/accessibility-menu\.js'\''\]/TeX: {equationNumbers: { autoNumber: "AMS"},extensions: \["cancel\.js","\[Contrib\]\/physics\/physics\.js","\[Contrib\]\/siunitx\/siunitx\.js"\]}/' \
		MathJax-master/config/TeX-AMS_CHTML-full.js
	zip -r mathjax.zip MathJax-master/ >/dev/null

download:
	wget https://github.com/mathjax/MathJax/archive/master.zip -O MathJax-master.zip
	wget https://github.com/mathjax/MathJax-third-party-extensions/archive/master.zip -O MathJax-third-party-extensions-master.zip

clean:
	rm -rf MathJax-master/ MathJax-third-party-extensions-master/
	rm -f mathjax.zip

# also clean the downloaded resources
Clean:
	rm -rf MathJax-master/ MathJax-third-party-extensions-master/
	rm -f mathjax.zip MathJax-master.zip MathJax-third-party-extensions-master.zip
