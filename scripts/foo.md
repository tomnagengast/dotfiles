# Markdown Scripts

It's possible to write scripts using markdown. Only code blocks will be executed
by zx. Try to run `zx examples/markdown.md`.

```js
await $`whoami`
await $`ls -la ${__dirname}`
```

The `__filename` will be pointed to **markdown.md**:

```js
console.log(chalk.yellowBright(__filename))
```

We can use imports here as well:

```js
console.log(chalk.yellowBright`If file has no extension, zx assumes it's ESM.`)
await $`pwd`
console.log('__filename =', __filename)
console.log('__dirname  =', __dirname)
```
