package library.model;

public class Book {
    private int id;
    private String author;
    private String title;
    private String isbn13;
    private int pages;
    private String publisher;
    private double price;
    private String image;

    public Book() {
    }

    public Book(int id, String author, String title, String isbn13, int pages, String publisher, double price, String image) {
        this.id = id;
        this.author = author;
        this.title = title;
        this.isbn13 = isbn13;
        this.pages = pages;
        this.publisher = publisher;
        this.price = price;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIsbn13() {
        return isbn13;
    }

    public void setIsbn13(String isbn13) {
        this.isbn13 = isbn13;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", isbn13='" + isbn13 + '\'' +
                ", pages=" + pages +
                ", publisher='" + publisher + '\'' +
                ", price='" + price + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
