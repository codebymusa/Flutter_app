package za.co.wethinkcode.server.api;

import io.javalin.http.Context;
import io.javalin.http.HttpCode;
import net.lemnik.eodsql.QueryTool;
import za.co.wethinkcode.server.database.QuoteDB;
import za.co.wethinkcode.server.domain.Quote;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class QuoteApiHandler {
    private final QuoteDB database;
    private Connection Connection;
    

    public QuoteApiHandler(){
        try {
            this.Connection = DriverManager.getConnection("jdbc:sqlite:Quotes");
        }catch(SQLException e){
            throw new RuntimeException(e);

        }
        this.database = QueryTool.getQuery(this.Connection, QuoteDB.class);
    }

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public void getAll(Context context) {
        context.json(database.all());
    }

    /**
     * Get one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public void getOne(Context context) {
        Integer id = context.pathParamAsClass("id", Integer.class).get();
        Quote quote = database.get(id);
        context.json(quote);
    }

    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public void create(Context context) {
        Quote quote = context.bodyAsClass(Quote.class);
        Quote newQuote = database.add(quote.getText(), quote.getName());
        context.header("Location", "/quote/" + newQuote.getId());
        context.status(HttpCode.CREATED);
        context.json(newQuote);
    }
}