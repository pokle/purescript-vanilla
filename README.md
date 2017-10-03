# Vanilla

I want to see if I can get fast purescript typesafe user interfaces by going straight to the DOM. As an added challenge, I also want to render when the DOM is unavailable - on the server side.

## Work in progress
- Trying to nut out the [DESIGN.md](DESIGN.md) right now.

## Trying it out
- Ensure you have the purescript essentials installed globally - pulp, bower 

Browser examples:
- run `make examples`
- Open one of the examples listed in the output.

Nodejs examples:
```
$ make
$ node -e "require('./output/Examples.Log/index.js').main()"
Hello there, this is a log message.
```