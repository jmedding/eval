# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Eval.Repo.insert!(%Eval.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Eval.Repo
alias Eval.Dropper
alias Eval.Instance
alias Eval.Review

Repo.delete_all Instance
Repo.delete_all Review
Repo.delete_all Dropper

brands = [
 "9point8",
 "fox",
 "rockshox",
 "ks",
 "magura"
]

Enum.map brands, fn(brand) -> Code.load_file("priv/repo/droppers/" <> brand <> "/droppers.exs") end
