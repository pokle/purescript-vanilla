# Design

- Leverage the DOM - it has come a long way, and is performant.
    - Don't abstract it to a virtual dom
    - Encourage safe modifications of the dom rather than data diffing.
- Isomorphic apps
    - Yes, the DOM isn't available on the server. But that doesn't mean we should force the usage of a Virtual DOM on the client. That in my opinion is an extra layer of abstraction.
    - Instead, do what's best in the right environment:
        - server: Generate a string (for a quick js-less initial render, for crawlers)
        - browser: Interact with the DOM (Event listeners, modify the DOM)

- Connection this all sounds like D3! https://d3js.org

# Influences
- I really like how Haxl batches updates with a cache. Infact its api seems to only batch.

# DOM modifications
Only need to happen in the browser. Server side code only needs to render a string.

Data diffing encourages you to wastefully generate a full representation of your entire page (with optimisations) on every change. Instead, is there a way we can represent the specific DOM changes required? An idempotent representation?

Can event listeners return idempotent effects?

    onClick event = ensureNodeHasClass event.target "checked"
    onClick event = ensureNodeHasNoClass event.target "checked"
    onClick event = ensureNodeHasText event.target (show (count + 1))

## What about when new data arrives, and you have to re-render all the items in a todo list?

    onData newItems oldItems = 
            concat [ fmap ensureTodoItem newItems
                   , fmap ensureNodeDoesntExist (oldItems `difference` newItems) ]
                    -- Diff your data, not the DOM.    

    ensureTodoItem i = ensureNode "li" [["class" (checkedClass i.done)]] i.text

## What about when two far away parts of the UI depend on the same data?

Say like TODO list and counts both depend on the same Array TodoItem 

# Data

component :: data -> Array DOMActions

# Login form example

This one can be quite complex with:
- Validation while you type (triggers after first key in input)
- Form submission, with error messages

# Usability

- Can I use it from the Chrome console? 😵
    - What are purescript source maps like? 
        - Not supported yet https://github.com/purescript/purescript/issues/2096
        - But you can just use webpack apparently https://github.com/ethul/purs-loader
            - And it gives you webpack dev server with hot reloading