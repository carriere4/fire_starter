defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  alias FireStarter.Screencast
  #alias FireStarter.{Repo, Video}  can get rid of this now b/c no longer using these repos

  def index(conn, _) do
    videos = Screencast.list_videos() #Repo.all(Video)
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _) do
    changeset = Screencast.change_video() #Video.changeset(%Video{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    #changeset = Video.changeset(%Video{}, video_params)
    case Screencast.create_video(video_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Video created successfully")
        |> redirect(to: video_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => video_id}) do
    #video = Repo.get(Video, video_id)
    #Repo.delete(video)
    Screencast.delete_video(video_id)
    conn
    |> put_flash(:info, "Video deleted successfully")
    |> redirect(to: video_path(conn, :index))
  end
end
