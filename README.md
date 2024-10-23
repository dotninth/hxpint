[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner-direct.svg)](https://supportukrainenow.org/)

<br>

<p align="center">
    <a href="https://github.com/dotninth/hxpint#gh-light-mode-only">
        <img src="./.github/assets/hxpint-light.svg" alt="Laravel Tachyon">
    </a>
    <a href="https://github.com/dotninth/hxpint#gh-dark-mode-only">
        <img src="./.github/assets/hxpint-dark.svg" alt="Laravel Tachyon">
    </a>
</p>

## 🚀 Introduction

`hxpint` is a simple Bash script that allows you to use [Laravel Pint][link-laravel-pint] as a formatter for PHP files in [Helix Editor][link-helix-editor].

The problem without this script is that [Helix][link-helix-editor] puts the contents of the file into `stdin` and takes the formatted version from `stdout`, and [Laravel Pint][link-laravel-pint] formats the file and saves it. The only way to use it was via `dprint` and `:reload-all` command in [Helix][link-helix-editor]. But it's inconvenient because you should run `:rla` command after each save and should be aware of it all the time.

`hxpint` solves this problem.

<br>

## 🏁 Getting Started

### Requirements

- **[PHP 8.2+][link-php-releases]**
- **[Laravel 11.0+][link-laravel]**
- **[Laravel Pint][link-laravel-pint]**

### Installation & Helix Configuration

If you don't have [Laravel Pint][link-laravel-pint] installed yet, install it through the [Composer][link-composer]:

```zsh
composer require laravel/pint --dev
```

Now clone the repo and install the script. You can install it in any directory you want, I show you an example of the default `$HOME/.local/bin` folder in Linux here.

```zsh
git clone git@github.com:dotninth/hxpint.git
cd hxpint
chmod +x ./hxpint.sh
mv hxpint.sh $HOME/.local/bin
```

> [!IMPORTANT]
> The path to the folder where you put the `hxpint` script should be in your `.bashrc` or `.zshrc`!

Now add `hxpint` to your [Helix][link-helix-editor] `languages.toml` configuration file.

```zsh
hx $HOME/.config/helix/languages.toml
```

```toml
[[language]]
name = "php"
formatter = { command = "hxpint.sh", args = ["--stdin"] }
auto-format = true
```

**And that's it!** Open any PHP file in your [Laravel][link-laravel] project and see if `hxpint` works. You can break the formatting and run the `:fmt` command.

<br>

## 📄 License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[link-laravel-pint]: https://github.com/laravel/pint
[link-helix-editor]: https://github.com/helix-editor/helix
[link-laravel]: https://github.com/laravel/laravel
[link-php-releases]: https://php.net/releases/
[link-composer]: https://getcomposer.org/
