# eden

I'm experimenting with GHC's Backpack mechanism to
write ["polymorphic code"](https://brianmckenna.org/blog/polymorphic_programming)

Requires cabal2+ and GHC8.2+, or nix.

`nix-build . && ./result/bin/eden-demo`

or

```
cabal sandbox init 
cabal install --only-dependencies
cabal new-build
# then find the executable and run it, since new-run seems to be broken
```

## `eden-demo`

[Here's the file](https://github.com/LightAndLight/eden/blob/master/src/Main.hs), and this is what it outputs:

```
My program...

...As Javascript:
function (x) { return x; }
function (x) { return function (y) { return x; }; }
(function (x) { return x; })(function (x) { return function (y) { return x; }; })

...As Python:
lambda x: x
lambda x: lambda y: x
(lambda x: x)(lambda x: lambda y: x)

Python translated from JavaScript via lambda calculus
lambda x: x

JavaScript translated from Python via lambda calculus
function (x) { return function (y) { return x; }; }
```
