# Design

- Use recursive data types to represent your component hierarchy. 
- Use typeclasses to give your data structures abilities - such as manipulating the dom, rendering to a HTML string, or even generate CSS.
- What about IO actions returned by the manipulation or rendering functions?

- Rendering in a web browser
    - Don't abstract the DOM to a virtual dom
    - Encourage safe modifications of the dom rather than data diffing. 
    - Diff your data, not your DOM.
- Rendering on the web server
    - Stream your components to a string buffer for performance. This forces a particular order of traversal.

# Influences
- Vanilla JS is performant because the DOM is performant now.
- This all sounds like D3! https://d3js.org
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