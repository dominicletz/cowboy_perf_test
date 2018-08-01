defmodule CowboyTest do
  use Application

  def start(_type, _args) do
    dispatch =
      :cowboy_router.compile([
        {:_, [{"/", CowboyTest, []}]}
      ])

    {:ok, _} =
      :cowboy.start_clear(:http, [{:port, 8080}], %{
        env: %{dispatch: dispatch},
        max_keepalive: 1000
      })

    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def hello do
    :world
  end

  def init(req0, opts) do
    method = :cowboy_req.method(req0)
    hasBody = :cowboy_req.has_body(req0)
    req = maybe_echo(method, hasBody, req0)
    {:ok, req, opts}
  end

  def maybe_echo("POST", true, req0) do
    {:ok, postVals, req} = :cowboy_req.read_urlencoded_body(req0)
    echo = :proplists.get_value("echo", postVals)
    echo(echo, req)
  end

  def maybe_echo("POST", false, req) do
    :cowboy_req.reply(400, [], "Missing body.", req)
  end

  def maybe_echo("GET", false, req) do
    :cowboy_req.reply(
      200,
      %{
        "content-type" => "text/plain; charset=utf-8"
      },
      "this is cowboy",
      req
    )
  end

  def maybe_echo(_, _, req) do
    # Method not allowed.
    :cowboy_req.reply(405, req)
  end

  def echo(:undefined, req) do
    :cowboy_req.reply(400, [], "Missing echo parameter.", req)
  end

  def echo(echo, req) do
    :cowboy_req.reply(
      200,
      %{
        "content-type" => "text/plain; charset=utf-8"
      },
      echo,
      req
    )
  end
end
