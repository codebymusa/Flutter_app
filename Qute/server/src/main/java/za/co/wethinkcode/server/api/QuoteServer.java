package za.co.wethinkcode.server.api;

import io.javalin.Javalin;

public class QuoteServer {
    private final Javalin server;
    private QuoteApiHandler quoteApiHandler = new QuoteApiHandler();

    public QuoteServer() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
        });

        this.server.get("/quotes", context -> quoteApiHandler.getAll(context));
        this.server.get("/quote/{id}", context -> quoteApiHandler.getOne(context));
        this.server.post("/quotes", context -> quoteApiHandler.create(context));
    }

    public static void main(String[] args) {
        QuoteServer server = new QuoteServer();
        server.start(5000);
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }
}