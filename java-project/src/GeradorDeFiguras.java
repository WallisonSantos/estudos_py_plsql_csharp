import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class GeradorDeFiguras {
    
    public void criaFiguras(InputStream inputStream, String nomeFile) throws Exception {

        // Leitura da Imagem
        // InputStream inputStream = new URL("https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png").openStream();
        BufferedImage imagemGalax = ImageIO.read(inputStream);


        // Cria nova imagem em memória com transparencia e com tamanho novo
        int largura = imagemGalax.getWidth();
        int altura = imagemGalax.getHeight();
        int novaAltura = altura + 80;
        BufferedImage vectorImagemGalax = new BufferedImage(largura, novaAltura, BufferedImage.TRANSLUCENT);

        
        // Copiar a imagem original original para nova imagem (em memória)
        Graphics2D graphics =  (Graphics2D) vectorImagemGalax.getGraphics();
        graphics.drawImage(imagemGalax, 0, 0, null);
        

        // Configurar a Fonte
        var font = new Font(Font.SANS_SERIF, Font.BOLD, 20);
        graphics.setFont(font);
        graphics.setColor(Color.BLUE);
   

        // Escrever uma frase na nova imagem 
        graphics.drawString(" Google ", 50, novaAltura - 30);


        // Escrever a nova imagem em um arquivo
        ImageIO.write(vectorImagemGalax, "png", new File(nomeFile));
    }
}
