# homebrew-yaw

<a href="https://www.producthunt.com/products/yaw-terminal/reviews/new?utm_source=badge-product_review&utm_medium=badge&utm_source=badge-yaw-terminal" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/product_review.svg?product_id=1224259&theme=dark" alt="Yaw Terminal - For workflows w AI tools, SSH, &amp; database connections. | Product Hunt" width="250" height="54" /></a> <a href="https://x.com/TokenLimitNews"><img src="https://img.shields.io/badge/follow-%40TokenLimitNews-000000?logo=x&logoColor=white" alt="Follow @TokenLimitNews on X"></a>

Homebrew tap for [yaw](https://yaw.sh) — terminal, ai, connections.

## Usage

```
brew trust yawlabs/yaw   # trust first: current Homebrew refuses to tap an untrusted third-party tap
brew tap yawlabs/yaw
brew install --cask yaw
```

> Run `brew trust` before `brew tap`. Current Homebrew validates a tap while
> cloning it and refuses to load anything from an untrusted one, so tapping
> first fails with "Cannot tap yawlabs/yaw: invalid syntax in tap!". On
> Homebrew older than 5.1 the `brew trust` line is unnecessary (and the command
> does not exist); skip it. The `install-mac.sh` one-liner handles this
> automatically.

The tap also carries [oam](https://oamjs.org), a JavaScript/TypeScript runtime:

```
brew install yawlabs/yaw/oam
```

## MCP servers

The Yaw Labs MCP servers install from npm, not from this tap:
`npx -y @yawlabs/<name>` (for example `npx -y @yawlabs/aws-mcp`). See
[yaw.sh/mcp-servers](https://yaw.sh/mcp-servers/) for the full list. Their old
formulae are disabled here, so `brew install` refuses them and points you to
npm; remove an existing keg with `brew uninstall <name>`.

## Update

```
brew upgrade --cask yaw
brew upgrade yawlabs/yaw/oam
```
