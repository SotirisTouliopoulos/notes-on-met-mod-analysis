# build en book
echo "# build en book"
jupyter-book build notebooks
jupyter-book build --builder pdflatex notebooks

# cp en assets
echo "# cp en assets"
cp static/index.html _build/html/
cp static/book-logo.png _build/html/
# cp static/CNAME _build/html/
cp _build/latex/book.pdf _build/html/ 2>/dev/null || :

# deploy book
echo "# deploy book"
ghp-import -n -p -f _build/html
