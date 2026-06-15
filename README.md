# homebrew-yaw

<a href="https://www.producthunt.com/products/yaw-terminal/reviews/new?utm_source=badge-product_review&utm_medium=badge&utm_source=badge-yaw-terminal" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/product_review.svg?product_id=1224259&theme=dark" alt="Yaw Terminal - For workflows w AI tools, SSH, &amp; database connections. | Product Hunt" width="250" height="54" /></a>

Homebrew tap for [yaw](https://yaw.sh) — terminal, ai, connections.

## Usage

```
brew tap yawlabs/yaw
brew trust yawlabs/yaw   # Homebrew 5.1+ refuses casks from untrusted third-party taps
brew install --cask yaw
```

> On Homebrew older than 5.1 the `brew trust` line is unnecessary (and the
> command does not exist); skip it. The `install-mac.sh` one-liner handles this
> automatically.

## Update

```
brew upgrade --cask yaw
```
