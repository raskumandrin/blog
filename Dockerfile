FROM jekyll/builder:latest

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock* ./
RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
 
# LOCAL DEVELOPMENT

# docker build -t jblog .
# docker run --rm -it -p 4000:4000 -v "$PWD:/srv/jekyll" jblog bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling
