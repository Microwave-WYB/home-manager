# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = false

def my-env [path: string] {
    open $path
    | lines
    | each { |line|
        if ($line | str starts-with 'export') {
            let parts = ($line | str substring 7..) | split row '='
            if ($parts | length) > 1 {
                let name = $parts.0
                let value = ($parts | skip 1 | str join '=')
                {$name: $value}
            }
        }
    }
    | compact
    | reduce -f {} {|it, acc| $acc | merge $it}
    | load-env
}

let env_file = ($env.HOME | path join '.env')
if ($env_file | path exists) {
    my-env $env_file
}
$env.config.edit_mode = 'vi'

alias zed = zeditor
alias va = exec uv run nu

def row-to-json [stmt: string] {
  "SELECT row_to_json(t) FROM (\n" + $stmt + "\n) t"
}


source ~/.zoxide.nu
