# homebrew-yaw

Homebrew tap for [yaw](https://yaw.sh) — terminal, ai, connections.

## Usage

```
brew trust yawlabs/yaw   # trust first: Homebrew won't load casks from an untrusted third-party tap
brew tap yawlabs/yaw
brew install --cask yaw
```

> Run `brew trust` before `brew tap`. Since Homebrew 6.0.0, Homebrew refuses
> to load formulae and casks from a third-party tap until you trust it, so
> without that line `brew install --cask yaw` fails with "Refusing to load cask
> yawlabs/yaw/yaw from untrusted tap yawlabs/yaw". Homebrew 7.0.0 and 7.0.1
> also verify every formula and cask while cloning a tap, so on those versions
> tapping first fails with "Cannot tap yawlabs/yaw: invalid syntax in tap!"
> (fixed in 7.0.2). `brew trust` does not exist before Homebrew 5.1.15. If it
> is not found, run `brew update` first and then run it: `brew tap` and
> `brew install` normally update Homebrew to the current release on their
> own, and that release requires the trust. The `install-mac.sh` one-liner
> handles all of this on Homebrew 5.1.15 and newer.

The tap also carries [oam](https://oamjs.org), a JavaScript/TypeScript runtime.
Installing it by its full name trusts just that formula, so no `brew trust` is
needed:

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

If a plain `brew upgrade` never picks up a new yaw, or `brew upgrade --cask yaw`
fails with "Refusing to load cask yawlabs/yaw/yaw from untrusted tap
yawlabs/yaw", the tap was most likely added before Homebrew 6.0.0 made trust
the default, and nothing has trusted it since.
`brew upgrade` and `brew outdated` skip casks and formulae from an untrusted tap
without a warning. Trust the tap once:

```
brew trust yawlabs/yaw
```

<a href="https://x.com/TokenLimitNews"><img src="https://img.shields.io/badge/follow-%40TokenLimitNews-000000?logo=x&logoColor=white" alt="Follow @TokenLimitNews on X"></a>
