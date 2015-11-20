# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Castle.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Castle.Repo.insert!(%Castle.Book{isbn: "978-0575097360", title: "The Way of Kings Part One", genre: "Fantasy", author: "Brandon Sanderson", word_count: 200000, pages: 608, status: "Currently Reading"})
Castle.Repo.insert!(%Castle.Book{isbn: "978-0575102484", title: "The Way of Kings Part Two", genre: "Fantasy", author: "Brandon Sanderson", word_count: 187000, pages: 585, status: "Up Next"})
Castle.Repo.insert!(%Castle.Book{isbn: "978-0575081406", title: "The Name of the Wind (The Kingkiller Chronicle)", genre: "Fantasy", author: "Patrick Rothfuss", word_count: 259000, pages: 672, status: "Completed"})
