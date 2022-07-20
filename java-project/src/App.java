import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.List;
import java.util.Map;

public class App {
    public static void main(String[] args) throws Exception {

        // Fazer uma conexão HTTP e buscar os top 250 filmes:
        String url   = "https://mocki.io/v1/9a7c1ca9-29b4-4eb3-8306-1adb9d159060";
        

        URI endereco = URI.create(url);
        var client   = HttpClient.newHttpClient();
        var request  = HttpRequest.newBuilder(endereco).GET().build();


        // Utilizar of String pois o send precisa saber que queremos parsear um object do tipo String
        HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
        

        String body  = response.body();


        // extrair só os dados que interessam (título, poster, classificação)
        var parser   = new JsonParser();
        List<Map<String, String>> listaDeFlmes = parser.parse(body);

        System.out.println(listaDeFlmes.size());
        System.out.println(listaDeFlmes.get(0));


        // exibir e manipular os dados 
        for (Map<String,String> filme : listaDeFlmes) {
            System.out.println(filme.get("title"));
            System.out.println(filme.get("image"));
            System.out.println(filme.get("imdbRating"));
            System.out.println("\n");
        }



    }
}
