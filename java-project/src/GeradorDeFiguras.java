import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;

public class GeradorDeFiguras {
    
    public void criaFiguras() throws Exception {

        // Leitura da Imagem
        BufferedImage imagemGalax = ImageIO.read(new File("java-project/galax.jpg"));


        // Cria nova imagem em memória com transparencia e com tamanho novo
        int largura = imagemGalax.getWidth();
        int altura = imagemGalax.getHeight();
        int novaAltura = altura + 200;
        BufferedImage novaImagemGalax = new BufferedImage(largura, novaAltura, BufferedImage.TRANSLUCENT);


        // Copiar a imagem original original para nova imagem (em memória)
        Graphics2D graphics =  (Graphics2D) novaImagemGalax.getGraphics();
        graphics.drawImage(imagemGalax, 0, 0, null);
        
        // Escrever uma frase na nova imagem 



        // Escrever a nova imagem em um arquivo
        ImageIO.write(novaImagemGalax, "png", new File("java-project/newgalax.png"));


        
    }

    public static void main(String[] args) throws Exception {
        var GerFig = new GeradorDeFiguras();
        GerFig.criaFiguras();

    }

}
