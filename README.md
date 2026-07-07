# markdown-cv

A curriculum vitae maintained in plain text and rendered to HTML and PDF using CSS.

For more details, see the [project page](http://elipapa.github.io/markdown-cv), or the blog post on [why I switched to markdown for my CV](http://elipapa.github.io/blog/why-i-switched-to-markdown-for-my-cv.html).

***

## Customization

Simply [fork the markdown-cv repo](https://github.com/elipapa/markdown-cv)

![](https://help.github.com/assets/images/help/repository/fork_button.jpg)

and edit the `index.md` file [directly in Github](https://help.github.com/articles/editing-files-in-your-repository/)

![](https://help.github.com/assets/images/help/repository/edit-file-edit-button.png)

adding your skills, jobs and education.

![](https://help.github.com/assets/images/help/repository/edit-readme-light.png)

## Distribution

To transform your plain text CV into a beautiful and shareable HTML page, you have two options:

### I. Use Github Pages to publish it online

1. Delete the existing `gh-pages` branch from your fork. It will only contain this webpage. You can either use git or [the Github web interface](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/#deleting-a-branch).
2. Create a new branch called `gh-pages`.
3. Head to *yourusername*.github.io/markdown-cv to see your CV live.

Any change you want to make to your CV from then on would have to be done on the `gh-pages` branch and will be immediately rendered by Github Pages.

### II. Build it locally and print a PDF

1. [Clone](https://help.github.com/en/articles/cloning-a-repository) your fork of markdown-cv to your local machine.
2. Install Ruby/bundler, then run `bundle install` from the project root. This installs the exact `jekyll`/`webrick` versions pinned in the `Gemfile`.
3. Type `bundle exec jekyll serve` to render your CV at http://localhost:4000.
4. You can edit the `index.md` file and see the changes live in your browser.
5. To print a PDF, press <kbd>⌘</kbd> + <kbd>p</kbd> (or <kbd>Ctrl</kbd> + <kbd>p</kbd>). Print and web CSS media queries should take care of the styling. The location line shows the date the page was built.

#### Generate the PDF without a browser

Run `bash generate-pdf.sh` (or `chmod +x generate-pdf.sh` once, then `./generate-pdf.sh`). This:

- runs `bundle exec jekyll build`, which stamps "Graz, Steiermark, am ..." with the current date (via `site.time` in `index.md`), and
- pipes the built `_site/index.html` through headless Chrome/Chromium's `--print-to-pdf`, applying the print CSS automatically.

Requires `google-chrome`, `chromium`, or `chromium-browser` on your `PATH` (`sudo apt install chromium-browser` on Ubuntu/WSL). Output defaults to `cv.pdf`; pass a different path as the first argument.

## Styling

The included CSS will render your CV in two styles:
s
1. `kjhealy` the original default, inspired by [kjhealy's vita
template](https://github.com/kjhealy/kjh-vita).
2. `davewhipp` is a tweaked version of `kjhealy`, with bigger fonts and dates
  right aligned.

To change the default style, simply change the variable in the
`_config.yml` file.

Any other styling is possible. More CSS style contributions and forks are welcome!

### Author

Eliseo Papa ([Twitter](http://twitter.com/elipapa)/[Github](http://github.com/elipapa)/[Website](https://elipapa.github.io)).

![Eliseo Papa](https://s.gravatar.com/avatar/eae1f0c01afda2bed9ce9cb88f6873f6?s=100)

### License

[MIT License](https://github.com/elipapa/markdown-cv/blob/master/LICENSE)
