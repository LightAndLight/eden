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
