docker rm jekyll
docker run --name jekyll -v $PWD/.:/srv/jekyll \
-it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages jekyll serve 



