alias FireStarter.{Repo,Video}

Repo.delete_all(Video)

elixir = %Video{title: "Elixir 101", duration: 120}
javascript = %Video{title: "Advanced JS", duration: 300}

Enum.each([elixir, javascript], &( Repo.insert(&1) ))


# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FireStarter.Repo.insert!(%FireStarter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
