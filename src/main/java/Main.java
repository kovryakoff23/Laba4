import org.flywaydb.core.Flyway;

public final class Main {
  public static void main(String[] args) {
    final Flyway flyway=Flyway.configure().dataSource("jdbc:postgresql://127.0.0.1:5432/Test","postgres","2357")
        .locations("db")
        .load();
    flyway.clean();
    flyway.migrate();
  }
}
