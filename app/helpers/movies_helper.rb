module MoviesHelper
  def embed_youtube(url)
    tag.iframe(
      width: 304,
      height: 166,
      src: url,
      frameborder: 0,
      allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
      allowfullscreen: true
    )
  end
end
