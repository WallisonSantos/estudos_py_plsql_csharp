import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.List;
import java.util.Map;

public class App {
    public static void main(String[] args) throws Exception {

        // Fazer uma conexão HTTP e buscar os top 250 filmes:
        String url   = "https://raw.githubusercontent.com/alexfelipe/imersao-java/json/top250.json";
        
        URI endereco = URI.create(url);
        var client   = HttpClient.newHttpClient();
        var request  = HttpRequest.newBuilder(endereco).GET().build();

        // Utilizar of String pois o send precisa saber que queremos parsear um object do tipo String
        HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
        
        String body  = response.body();

        // extrair só os dados que interessam (título, poster, classificação)
        var parser   = new JsonParser();
        List<Map<String, String>> listaDeFilmes = parser.parse(body);

        System.out.println(listaDeFilmes.size());
        System.out.println(listaDeFilmes.get(0));

        // exibir e manipular os dados 
        for (Map<String,String> filme : listaDeFilmes) {
            
            String urlImg   = filme.get("image");
            String title    = filme.get("title");
            String nomeFile = title + ".png";

            InputStream inputStream = new URL(urlImg).openStream();

            var geraFig = new GeradorDeFiguras();

            geraFig.criaFiguras(inputStream, nomeFile);;

            System.out.println(title);
            System.out.println();
        }
    }
}