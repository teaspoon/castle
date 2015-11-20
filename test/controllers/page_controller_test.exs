defmodule Castle.PageControllerTest do
  use Castle.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "<div id=\"main\"></div>"
  end
end
