package za.co.wethinkcode.server.database;

import java.util.List;

import net.lemnik.eodsql.BaseQuery;
import net.lemnik.eodsql.Select;
import net.lemnik.eodsql.Update;
import za.co.wethinkcode.server.domain.Quote;

public interface QuoteDB extends BaseQuery{
    /**
     * Get a single quote by id.
     * @param id the Id of the quote
     * @return a Quote
     */
    @Select("SELECT * " + 
    "FROM quotes WHERE id = ?{1}"
    )
    Quote get(Integer id);
    /**
     * Get all quotes in the database
     * @return A list of quotes
     */
    @Select("SELECT * FROM quotes")
    List<Quote> all();

    /**
     * Add a single quote to the database.
     * @param quote the quote to add
     * @return the newly added Quote
     */
    @Update("INSERT INTO quotes (quote, author) VALUES(?{1},?{2})")
    Quote add(String quote, String author);
}
