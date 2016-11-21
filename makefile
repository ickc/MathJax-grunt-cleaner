mathjax:
	unzip MathJax.zip >/dev/null
	unzip MathJax-third-party-extensions.zip >/dev/null
	rsync -a Gruntfile.js MathJax-master/
	rsync -a package.json MathJax-master/
	cd MathJax-master && npm install && grunt template
	mkdir -p MathJax-master/contrib/physics/ MathJax-master/contrib/siunitx/
	rsync -a MathJax-third-party-extensions-master/physics/physics.js MathJax-master/contrib/physics/
	rsync -a MathJax-third-party-extensions-master/siunitx/siunitx.js MathJax-master/contrib/siunitx/
	rm -rf MathJax-master/node_modules/
	rm -f MathJax-master/.travis.yml MathJax-master/Gruntfile.js
	sed -i \
		-e 's/extensions: \['\''\[Contrib\]\/a11y\/accessibility-menu\.js'\''\]/TeX: {equationNumbers: { autoNumber: "AMS"},extensions: \["cancel\.js","\[Contrib\]\/physics\/physics\.js","\[Contrib\]\/siunitx\/siunitx\.js"\]}/' \
		-e 's/^MathJax\.Hub\.Config({$$/MathJax\.Ajax\.config\.path\["Contrib"\] = "contrib";MathJax\.Hub\.Config({/' \
		MathJax-master/config/TeX-AMS_CHTML-full.js
	zip -r mathjax.zip MathJax-master/

download:
	wget https://github.com/mathjax/MathJax/archive/master.zip -O MathJax.zip
	wget https://github.com/mathjax/MathJax-third-party-extensions/archive/master.zip -O MathJax-third-party-extensions.zip

clean:
	rm -rf MathJax-master/ MathJax-third-party-extensions-master/

# also clean the downloaded resources
Clean:
	rm -rf MathJax-master/ MathJax-third-party-extensions-master/
	rm -f MathJax.zip MathJax-third-party-extensions.zip
