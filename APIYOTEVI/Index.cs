using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using APIYOTEVI.modelos;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;

namespace APIYOTEVI
{
    public partial class index : System.Web.UI.Page
    {
        string key = "AIzaSyDKEUbjhVGRhTdNe2tBJq0seTFLgS1o71I"; // Reemplaza con tu clave de API de YouTube

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string buscar = txBuscar.Text;
            RegisterAsyncTask(new PageAsyncTask(async () =>
            {
                await GetYouTubeVideos(buscar);
            }));
        }

        private async Task GetYouTubeVideos(string searchTerm)
        {
            // Configura la API de YouTube
            var youtubeService = new YouTubeService(new BaseClientService.Initializer()
            {
                ApiKey = key,
                ApplicationName = this.GetType().ToString()
            });

            // Realiza la búsqueda de videos
            var searchListRequest = youtubeService.Search.List("snippet");
            searchListRequest.Q = searchTerm; // Utiliza el término de búsqueda proporcionado
            searchListRequest.MaxResults = 50;

            var searchListResponse = await searchListRequest.ExecuteAsync();

            // Procesa los resultados y actualiza el GridView
            List<VideoModel> listaVideos = new List<VideoModel>();
            foreach (var searchResult in searchListResponse.Items)
            {
                listaVideos.Add(new VideoModel()
                {
                    VideoId = searchResult.Id.VideoId,
                    Title = searchResult.Snippet.Title,
                    Imagen = searchResult.Snippet.Thumbnails.Medium.Url
                });
            }

            gridVideos.DataSource = listaVideos;
            gridVideos.DataBind();
        }
    }
}