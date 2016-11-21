# MathJax-grunt-cleaner

This repository uses a custom template to setup the latest MathJax, which includes

- AMS auto-numbering
- `cancel` extension
- MathJax 3rd party extensions `physics` & `siunitx`.

A `mathjax.zip` is released in GitHub, which is less than 2MB.

It is intended for CHTML use, e.g.

```html
<script type="text/javascript" src="mathjax/MathJax.js?config=TeX-AMS_CHTML-full"></script>
```

# Versioning

This use the version of MathJax, while prepend it with `-1`, etc. for sub-versioning.
