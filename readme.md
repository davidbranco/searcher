#Searcher

You have some queries, Searcher give you back query's results from the first page [of Google].

##Setting up and Using

```bash
bundle install
cd searcher
mkdir data
> data/terms.json
```

Add your query's terms to the `data/terms.json`.

```
ruby main.rb
```

Your results is going to be in `data/results.json`

##License

WTFPL