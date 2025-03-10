import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Journalization {

    private static Journalization instance;

    private PrintWriter writer;

    private Journalization() {
        try {
            writer = new PrintWriter(new FileWriter("journalization.txt", true));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static synchronized Journalization getInstance() {
        if (instance == null) {
            instance = new Journalization();
        }
        return instance;
    }

    public void log(String message) {
        String formattedMessage = "[" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH'h'mm")) + "] " + message;
        writer.println(formattedMessage);
        writer.flush();
        System.out.println(formattedMessage);
    }

    public void close() {
        writer.close();
    }

}
